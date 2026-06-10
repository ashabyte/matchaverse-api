const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

router.get('/stats/:userId', verifyFirebaseToken, async (req, res) => {
  try {
    const userId = req.params.userId;
    const [user] = await db.query('SELECT points FROM users WHERE id = ?', [userId]);
    const [rank] = await db.query(
      `SELECT COUNT(*) + 1 as rank FROM users WHERE points > (SELECT points FROM users WHERE id = ?)`,
      [userId]
    );
    res.json({ success: true, data: { points: user[0]?.points || 0, rank: rank[0]?.rank || 1 } });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil stats' });
  }
});

module.exports = router;
