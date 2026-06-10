const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM recipes ORDER BY created_at DESC');
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil resep' });
  }
});

router.get('/:id', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM recipes WHERE id = ?', [req.params.id]);
    if (!rows.length) return res.status(404).json({ error: 'Resep tidak ditemukan' });
    res.json({ success: true, data: rows[0] });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil resep' });
  }
});

router.post('/', verifyFirebaseToken, async (req, res) => {
  try {
    const { title, description, ingredients, steps, image_url, servings, prep_time, difficulty } = req.body;
    if (!title) return res.status(400).json({ error: 'Judul resep wajib diisi' });

    const [userRow] = await db.query('SELECT name FROM users WHERE id = ?', [req.user.uid]);
    const authorName = userRow[0]?.name || 'User';

    const [result] = await db.query(
      `INSERT INTO recipes (title, description, ingredients, steps, image_url, servings, prep_time, difficulty, author_id, author_name)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
      [title, description, JSON.stringify(ingredients || []), JSON.stringify(steps || []),
       image_url || '', servings || 1, prep_time || 0, difficulty || 'Mudah', req.user.uid, authorName]
    );
    const [newRow] = await db.query('SELECT * FROM recipes WHERE id = ?', [result.insertId]);
    res.status(201).json({ success: true, data: newRow[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Gagal membuat resep' });
  }
});

router.put('/:id', verifyFirebaseToken, async (req, res) => {
  try {
    const { title, description, ingredients, steps, image_url, servings, prep_time, difficulty } = req.body;
    await db.query(
      `UPDATE recipes SET title=?, description=?, ingredients=?, steps=?, image_url=?, servings=?, prep_time=?, difficulty=?
       WHERE id=? AND author_id=?`,
      [title, description, JSON.stringify(ingredients), JSON.stringify(steps),
       image_url, servings, prep_time, difficulty, req.params.id, req.user.uid]
    );
    res.json({ success: true, message: 'Resep berhasil diperbarui' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal memperbarui resep' });
  }
});

router.delete('/:id', verifyFirebaseToken, async (req, res) => {
  try {
    await db.query('DELETE FROM recipes WHERE id = ? AND author_id = ?', [req.params.id, req.user.uid]);
    res.json({ success: true, message: 'Resep berhasil dihapus' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal menghapus resep' });
  }
});

module.exports = router;
