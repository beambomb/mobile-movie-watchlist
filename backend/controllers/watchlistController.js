const WatchlistModel = require('../models/watchlistModel');

exports.getWatchlist = (req, res) => {
  const { status } = req.query;
  const items = WatchlistModel.getAll(status);
  res.json(items);
};

exports.createWatchlist = (req, res) => {
  const { showId, title } = req.body;
  if (!showId || !title) {
    return res.status(400).json({ error: 'showId dan title wajib diisi' });
  }

  const existing = WatchlistModel.findByShowId(showId);
  if (existing) {
    return res.status(409).json({ error: 'Film sudah ada di dalam watchlist' });
  }

  const item = WatchlistModel.create(req.body);
  res.status(201).json(item);
};

exports.updateWatchlist = (req, res) => {
  const { id } = req.params;
  const updated = WatchlistModel.update(id, req.body);
  if (!updated) {
    return res.status(404).json({ error: 'Item watchlist tidak ditemukan' });
  }
  res.json(updated);
};

exports.deleteWatchlist = (req, res) => {
  const { id } = req.params;
  const success = WatchlistModel.delete(id);
  if (!success) {
    return res.status(404).json({ error: 'Item watchlist tidak ditemukan' });
  }
  res.json({ message: 'Item berhasil dihapus', id });
};
