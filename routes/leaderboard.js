const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

router.get('/', verifyFirebaseToken, async (req, res) => {
  try {
    const [rows] = await db.query(
      `SELECT id as user_id, name as user_name, photo_url, points,
       RANK() OVER (ORDER BY points DESC) as rank_pos
       FROM users ORDER BY points DESC LIMIT 50`
    );
    const data = rows.map(r => ({ ...r, rank: r.rank_pos }));
    res.json({ success: true, data });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil leaderboard' });
  }
});

module.exports = router;
