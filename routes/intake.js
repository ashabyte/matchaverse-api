const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

// GET records (by date or month)
router.get('/', verifyFirebaseToken, async (req, res) => {
  try {
    const { userId, date, year, month } = req.query;
    let query = 'SELECT * FROM intake_records WHERE user_id = ?';
    const params = [userId || req.user.uid];

    if (date) {
      query += ' AND DATE(consumed_at) = ?';
      params.push(date);
    } else if (year && month) {
      query += ' AND YEAR(consumed_at) = ? AND MONTH(consumed_at) = ?';
      params.push(year, month);
    }
    query += ' ORDER BY consumed_at DESC';

    const [rows] = await db.query(query, params);
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil data intake' });
  }
});

// GET yearly stats
router.get('/yearly', verifyFirebaseToken, async (req, res) => {
  try {
    const { userId, year } = req.query;
    const uid = userId || req.user.uid;

    const [monthly] = await db.query(
      `SELECT MONTH(consumed_at) as month, COUNT(*) as count, SUM(grams_consumed) as total_grams, SUM(caffeine_amount) as total_caffeine
       FROM intake_records WHERE user_id = ? AND YEAR(consumed_at) = ?
       GROUP BY MONTH(consumed_at)`,
      [uid, year]
    );

    const [totals] = await db.query(
      `SELECT COUNT(*) as total_sessions, SUM(grams_consumed) as total_grams, SUM(caffeine_amount) as total_caffeine
       FROM intake_records WHERE user_id = ? AND YEAR(consumed_at) = ?`,
      [uid, year]
    );

    const [topType] = await db.query(
      `SELECT matcha_type, COUNT(*) as count FROM intake_records
       WHERE user_id = ? AND YEAR(consumed_at) = ?
       GROUP BY matcha_type ORDER BY count DESC LIMIT 1`,
      [uid, year]
    );

    res.json({
      success: true,
      data: {
        monthly_breakdown: monthly,
        totals: totals[0],
        top_matcha_type: topType[0] || null,
      }
    });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil yearly stats' });
  }
});

// CREATE record
router.post('/', verifyFirebaseToken, async (req, res) => {
  try {
    const { user_id, matcha_type, grams_consumed, caffeine_amount, notes, consumed_at } = req.body;
    if (!matcha_type || !grams_consumed) {
      return res.status(400).json({ error: 'Jenis matcha dan gram wajib diisi' });
    }
    const caffeine = caffeine_amount || (parseFloat(grams_consumed) * 35);

    const [result] = await db.query(
      `INSERT INTO intake_records (user_id, matcha_type, grams_consumed, caffeine_amount, notes, consumed_at)
       VALUES (?, ?, ?, ?, ?, ?)`,
      [user_id || req.user.uid, matcha_type, grams_consumed, caffeine, notes || '', consumed_at || new Date()]
    );
    const [newRow] = await db.query('SELECT * FROM intake_records WHERE id = ?', [result.insertId]);
    res.status(201).json({ success: true, data: newRow[0] });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mencatat intake' });
  }
});

// UPDATE record
router.put('/:id', verifyFirebaseToken, async (req, res) => {
  try {
    const { matcha_type, grams_consumed, caffeine_amount, notes } = req.body;
    await db.query(
      'UPDATE intake_records SET matcha_type=?, grams_consumed=?, caffeine_amount=?, notes=? WHERE id=? AND user_id=?',
      [matcha_type, grams_consumed, caffeine_amount, notes, req.params.id, req.user.uid]
    );
    res.json({ success: true, message: 'Intake berhasil diperbarui' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal memperbarui intake' });
  }
});

// DELETE record
router.delete('/:id', verifyFirebaseToken, async (req, res) => {
  try {
    await db.query('DELETE FROM intake_records WHERE id = ? AND user_id = ?', [req.params.id, req.user.uid]);
    res.json({ success: true, message: 'Intake berhasil dihapus' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal menghapus intake' });
  }
});

module.exports = router;
