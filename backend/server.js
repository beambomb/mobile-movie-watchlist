const express = require('express');
const cors = require('cors');
const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 5000;
const DATA_FILE = path.join(__dirname, 'data', 'watchlist.json');

app.use(cors());
app.use(express.json());

// Inisialisasi file data jika belum ada
function ensureDataFile() {
  const dir = path.dirname(DATA_FILE);
  if (!fs.existsSync(dir)) fs.mkdirSync(dir, { recursive: true });
  if (!fs.existsSync(DATA_FILE)) fs.writeFileSync(DATA_FILE, '[]', 'utf-8');
}

function readData() {
  ensureDataFile();
  try {
    const raw = fs.readFileSync(DATA_FILE, 'utf-8');
    return JSON.parse(raw);
  } catch (err) {
    return [];
  }
}

function writeData(data) {
  ensureDataFile();
  fs.writeFileSync(DATA_FILE, JSON.stringify(data, null, 2), 'utf-8');
}

app.get('/api/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

app.get('/api/watchlist', (req, res) => {
  const { status } = req.query;
  let items = readData();
  if (status && status !== 'All') {
    items = items.filter(i => i.status.toLowerCase() === status.toLowerCase());
  }
  res.json(items);
});

app.post('/api/watchlist', (req, res) => {
  const { showId, title, imageUrl, genres, status, userRating, userNotes } = req.body;
  if (!showId || !title) {
    return res.status(400).json({ error: 'showId dan title wajib diisi' });
  }

  const items = readData();
  const existing = items.find(i => i.showId === Number(showId));
  if (existing) {
    return res.status(409).json({ error: 'Film sudah ada di dalam watchlist' });
  }

  const newItem = {
    id: Date.now().toString(),
    showId: Number(showId),
    title,
    imageUrl: imageUrl || null,
    genres: Array.isArray(genres) ? genres : [],
    status: status || 'Plan to Watch',
    userRating: Number(userRating) || 0.0,
    userNotes: userNotes || '',
    addedAt: new Date().toISOString(),
    updatedAt: new Date().toISOString()
  };

  items.unshift(newItem);
  writeData(items);
  res.status(201).json(newItem);
});

app.put('/api/watchlist/:id', (req, res) => {
  const { id } = req.params;
  const { status, userRating, userNotes } = req.body;
  const items = readData();
  const idx = items.findIndex(i => i.id === id);

  if (idx === -1) {
    return res.status(404).json({ error: 'Item watchlist tidak ditemukan' });
  }

  items[idx] = {
    ...items[idx],
    status: status !== undefined ? status : items[idx].status,
    userRating: userRating !== undefined ? Number(userRating) : items[idx].userRating,
    userNotes: userNotes !== undefined ? userNotes : items[idx].userNotes,
    updatedAt: new Date().toISOString()
  };

  writeData(items);
  res.json(items[idx]);
});

app.delete('/api/watchlist/:id', (req, res) => {
  const { id } = req.params;
  const items = readData();
  const filtered = items.filter(i => i.id !== id);

  if (items.length === filtered.length) {
    return res.status(404).json({ error: 'Item watchlist tidak ditemukan' });
  }

  writeData(filtered);
  res.json({ message: 'Item berhasil dihapus', id });
});

app.listen(PORT, () => {
  console.log(`Backend server running on http://localhost:${PORT}`);
});
