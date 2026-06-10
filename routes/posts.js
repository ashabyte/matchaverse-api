const express = require('express');
const router = express.Router();
const db = require('../database/connection');
const { verifyFirebaseToken } = require('../middleware/auth');

router.get('/', async (req, res) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;

    const [rows] = await db.query(
      'SELECT * FROM community_posts ORDER BY created_at DESC LIMIT ? OFFSET ?',
      [limit, offset]
    );
    res.json({ success: true, data: rows });
  } catch (err) {
    res.status(500).json({ error: 'Gagal mengambil postingan' });
  }
});

router.post('/', verifyFirebaseToken, async (req, res) => {
  try {
    const { content, image_url, tags } = req.body;
    if (!content) return res.status(400).json({ error: 'Konten wajib diisi' });

    const [userRow] = await db.query('SELECT name, photo_url FROM users WHERE id = ?', [req.user.uid]);
    const [result] = await db.query(
      'INSERT INTO community_posts (user_id, user_name, user_photo, content, image_url, tags) VALUES (?, ?, ?, ?, ?, ?)',
      [req.user.uid, userRow[0]?.name || '', userRow[0]?.photo_url || '', content, image_url || '', JSON.stringify(tags || [])]
    );

    const [newPost] = await db.query('SELECT * FROM community_posts WHERE id = ?', [result.insertId]);

    // Emit WebSocket event
    const io = req.app.get('io');
    io?.emit('new_post', newPost[0]);

    // Award points
    await db.query('UPDATE users SET points = points + 5 WHERE id = ?', [req.user.uid]);

    res.status(201).json({ success: true, data: newPost[0] });
  } catch (err) {
    res.status(500).json({ error: 'Gagal membuat postingan' });
  }
});

router.delete('/:id', verifyFirebaseToken, async (req, res) => {
  try {
    await db.query('DELETE FROM community_posts WHERE id = ? AND user_id = ?', [req.params.id, req.user.uid]);
    res.json({ success: true, message: 'Postingan berhasil dihapus' });
  } catch (err) {
    res.status(500).json({ error: 'Gagal menghapus postingan' });
  }
});

router.post('/:id/like', verifyFirebaseToken, async (req, res) => {
  try {
    const { userId } = req.body;
    const uid = userId || req.user.uid;

    await db.query('INSERT IGNORE INTO post_likes (post_id, user_id) VALUES (?, ?)', [req.params.id, uid]);
    await db.query('UPDATE community_posts SET likes = likes + 1 WHERE id = ?', [req.params.id]);

    const io = req.app.get('io');
    io?.emit('new_like', { postId: req.params.id, userId: uid });

    res.json({ success: true });
  } catch (err) {
    res.status(500).json({ error: 'Gagal like postingan' });
  }
});

module.exports = router;
