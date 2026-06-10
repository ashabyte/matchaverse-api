const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

// Sync user dari Firebase ke MySQL
router.post('/sync', verifyFirebaseToken, async (req, res) => {
  try {
    const { uid, name, email, photo_url } = req.body;
    await db.query(
      `INSERT INTO users (id, name, email, photo_url) VALUES (?, ?, ?, ?)
       ON DUPLICATE KEY UPDATE name=VALUES(name), photo_url=VALUES(photo_url), updated_at=NOW()`,
      [uid || req.user.uid, name, email, photo_url]
    );
    const [rows] = await db.query('SELECT * FROM users WHERE id = ?', [uid || req.user.uid]);
    res.json({ success: true, data: rows[0] });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Gagal sinkronisasi user' });
  }
});

// Get user profile
router.get('/profile', verifyFirebaseToken, async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM users WHERE id = ?', [req.user.uid]);
    if (!rows.length) return res.status(404).json({ error: 'User tidak ditemukan' });
    res.json({ success: true, data: rows[0] });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil profil' });
  }
});

// Update FCM token
router.put('/fcm-token', verifyFirebaseToken, async (req, res) => {
  try {
    await db.query('UPDATE users SET fcm_token = ? WHERE id = ?', [req.body.fcm_token, req.user.uid]);
    res.json({ success: true });
  } catch (err) {
    res.status(500).json({ error: 'Gagal update FCM token' });
  }
});

module.exports = router;
