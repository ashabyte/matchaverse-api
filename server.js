require('dotenv').config();
const express = require('express');
const cors = require('cors');
const http = require('http');
const { Server } = require('socket.io');
const cron = require('node-cron');

const app = express();
const server = http.createServer(app);

// Socket.IO setup
const io = new Server(server, {
  cors: { origin: '*', methods: ['GET', 'POST'] },
  transports: ['websocket', 'polling'],
});

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Make io accessible in routes
app.set('io', io);

// Routes
app.use('/api/auth', require('./routes/auth'));
app.use('/api/products', require('./routes/products'));
app.use('/api/recipes', require('./routes/recipes'));
app.use('/api/news', require('./routes/news'));
app.use('/api/funfacts', require('./routes/funfacts'));
app.use('/api/intake', require('./routes/intake'));
app.use('/api/missions', require('./routes/missions'));
app.use('/api/badges', require('./routes/badges'));
app.use('/api/leaderboard', require('./routes/leaderboard'));
app.use('/api/gamification', require('./routes/gamification'));
app.use('/api/posts', require('./routes/posts'));

// Health check
app.get('/health', (req, res) => res.json({ status: 'OK', app: 'MatchaTea API' }));

// ===== SOCKET.IO =====
const onlineUsers = new Map();

io.on('connection', (socket) => {
  const userId = socket.handshake.query.userId;
  console.log(`User connected: ${userId} | socket: ${socket.id}`);

  if (userId) {
    onlineUsers.set(userId, socket.id);
    io.emit('online_count', { count: onlineUsers.size });
  }

  socket.on('user_online', ({ userId }) => {
    onlineUsers.set(userId, socket.id);
  });

  socket.on('disconnect', () => {
    onlineUsers.delete(userId);
    io.emit('online_count', { count: onlineUsers.size });
    console.log(`User disconnected: ${userId}`);
  });
});

// Export io for use in routes
module.exports.io = io;
module.exports.onlineUsers = onlineUsers;

// ===== CRON JOBS =====
// Daily mission reset at midnight
cron.schedule('0 0 * * *', async () => {
  console.log('[CRON] Resetting daily missions...');
  const db = require('./database/connection');
  await db.query('UPDATE user_missions SET is_completed = 0 WHERE mission_type = "daily"');
});

// Weekly mission reset on Monday midnight
cron.schedule('0 0 * * 1', async () => {
  console.log('[CRON] Resetting weekly missions...');
  const db = require('./database/connection');
  await db.query('UPDATE user_missions SET is_completed = 0 WHERE mission_type = "weekly"');
});

const PORT = process.env.PORT || 5000;
server.listen(PORT, '0.0.0.0', () => {
  console.log(`MatchaTea API running on port ${PORT}`);
  console.log(`WebSocket server ready`);
});
