const express = require('express');
const router = express.Router();
const db = require('../database/connection');

router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM matcha_news ORDER BY published_at DESC LIMIT 20');
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil berita' });
  }
});

module.exports = router;
