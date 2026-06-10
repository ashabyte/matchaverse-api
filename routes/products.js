const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

// GET semua produk (public)
router.get('/', async (req, res) => {
  try {
    const { category, search } = req.query;
    let query = 'SELECT * FROM matcha_products WHERE is_active = 1';
    const params = [];

    if (category && category !== 'Semua') {
      query += ' AND category = ?';
      params.push(category);
    }
    if (search) {
      query += ' AND (name LIKE ? OR description LIKE ?)';
      params.push(`%${search}%`, `%${search}%`);
    }
    query += ' ORDER BY created_at DESC';

    const [rows] = await db.query(query, params);
    res.json({ success: true, data: rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Gagal mengambil produk' });
  }
});

// GET produk by ID
router.get('/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM matcha_products WHERE id = ?', [req.params.id]);
    if (!rows.length) return res.status(404).json({ error: 'Produk tidak ditemukan' });
    res.json({ success: true, data: rows[0] });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil produk' });
  }
});

// CREATE produk (butuh auth)
router.post('/', verifyFirebaseToken, async (req, res) => {
  try {
    const { name, description, category, price, image_url, rating, origin, grade } = req.body;

    if (!name || !category) {
      return res.status(400).json({ error: 'Nama dan kategori wajib diisi' });
    }

    const [result] = await db.query(
      `INSERT INTO matcha_products (name, description, category, price, image_url, rating, origin, grade, created_by)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [name, description, category, price || 0, image_url || '', rating || 0, origin, grade, req.user.uid]
    );

    const [newProduct] = await db.query('SELECT * FROM matcha_products WHERE id = ?', [result.insertId]);
    res.status(201).json({ success: true, data: newProduct[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Gagal membuat produk' });
  }
});

// UPDATE produk (butuh auth)
router.put('/:id', verifyFirebaseToken, async (req, res) => {
  try {
    const { name, description, category, price, image_url, rating, origin, grade } = req.body;

    await db.query(
      `UPDATE matcha_products SET name=?, description=?, category=?, price=?, image_url=?, rating=?, origin=?, grade=?
       WHERE id=?`,
      [name, description, category, price, image_url, rating, origin, grade, req.params.id]
    );

    res.json({ success: true, message: 'Produk berhasil diperbarui' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal memperbarui produk' });
  }
});

// DELETE produk (soft delete, butuh auth)
router.delete('/:id', verifyFirebaseToken, async (req, res) => {
  try {
    await db.query('UPDATE matcha_products SET is_active = 0 WHERE id = ?', [req.params.id]);
    res.json({ success: true, message: 'Produk berhasil dihapus' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal menghapus produk' });
  }
});

module.exports = router;
