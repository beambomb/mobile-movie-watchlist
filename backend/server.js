const express = require('express');
const cors = require('cors');
const { initDb } = require('./config/db');
const watchlistRoutes = require('./routes/watchlistRoutes');
const { notFound, errorHandler } = require('./middlewares/errorHandler');

const app = express();
const PORT = process.env.PORT || 5000;

initDb();

app.use(cors());
app.use(express.json());

app.get('/', (req, res) => {
  res.json({
    name: 'Movie Watchlist API',
    status: 'running',
    endpoints: {
      health: 'GET /api/health',
      watchlist: 'GET, POST /api/watchlist',
      watchlistItem: 'PUT, DELETE /api/watchlist/:id'
    }
  });
});

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

app.use('/api/watchlist', watchlistRoutes);

app.use(notFound);
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`Backend server running on http://localhost:${PORT}`);
});
