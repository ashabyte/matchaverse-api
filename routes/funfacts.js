const express = require('express');
const router = express.Router();
const db = require('../database/connection');

router.get('/', async (req, res) => {
  try {
    const [rows] = await db.query('SELECT * FROM fun_facts ORDER BY RAND() LIMIT 5');
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil fun facts' });
  }
});

module.exports = router;
