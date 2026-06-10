const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

// GET missions user
router.get('/', verifyFirebaseToken, async (req, res) => {
  try {
    const { userId, type } = req.query;
    const uid = userId || req.user.uid;

    // Ensure user missions exist
    await db.query(
      `INSERT IGNORE INTO user_missions (user_id, mission_id, mission_type)
       SELECT ?, id, mission_type FROM missions WHERE is_active = 1`,
      [uid]
    );

    let query = `SELECT m.*, um.is_completed, um.completed_at
      FROM missions m LEFT JOIN user_missions um ON m.id = um.mission_id AND um.user_id = ?
      WHERE m.is_active = 1`;
    const params = [uid];

    if (type) { query += ' AND m.mission_type = ?'; params.push(type); }

    const [rows] = await db.query(query, params);
    res.json({ success: true, data: rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Gagal mengambil misi' });
  }
});

// Complete a mission
router.post('/complete', verifyFirebaseToken, async (req, res) => {
  try {
    const { missionId, userId } = req.body;
    const uid = userId || req.user.uid;

    const [mission] = await db.query('SELECT * FROM missions WHERE id = ?', [missionId]);
    if (!mission.length) return res.status(404).json({ error: 'Misi tidak ditemukan' });

    await db.query(
      `UPDATE user_missions SET is_completed = 1, completed_at = NOW()
       WHERE user_id = ? AND mission_id = ? AND is_completed = 0`,
      [uid, missionId]
    );

    const points = mission[0].points_reward;
    await db.query('UPDATE users SET points = points + ? WHERE id = ?', [points, uid]);

    // Check for badge unlocks
    await checkAndAwardBadges(uid);

    res.json({ success: true, data: { pointsEarned: points } });
  } catch (err) {
    res.status(500).json({ error: 'Gagal menyelesaikan misi' });
  }
});

async function checkAndAwardBadges(userId) {
  const [missionCount] = await db.query(
    'SELECT COUNT(*) as count FROM user_missions WHERE user_id = ? AND is_completed = 1', [userId]
  );
  const count = missionCount[0].count;

  const [badges] = await db.query(
    'SELECT * FROM badges WHERE condition_type = "mission_count" AND condition_value <= ?', [count]
  );

  for (const badge of badges) {
    await db.query(
      'INSERT IGNORE INTO user_badges (user_id, badge_id) VALUES (?, ?)',
      [userId, badge.id]
    );
  }
}

module.exports = router;
