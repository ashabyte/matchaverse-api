const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

router.get('/', verifyFirebaseToken, async (req, res) => {
  try {
    const userId = req.query.userId || req.user.uid;
    const [rows] = await db.query(
      `SELECT b.*, IF(ub.user_id IS NOT NULL, 1, 0) as is_earned, ub.earned_at
       FROM badges b LEFT JOIN user_badges ub ON b.id = ub.badge_id AND ub.user_id = ?
       ORDER BY is_earned DESC, b.id ASC`,
      [userId]
    );
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil badge' });
  }
});

module.exports = router;
