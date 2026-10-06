const { readDb, writeDb } = require('../config/db');

const WatchlistModel = {
  getAll(status) {
    const items = readDb();
    if (status && status !== 'All') {
      return items.filter(i => i.status.toLowerCase() === status.toLowerCase());
    }
    return items;
  },

  findByShowId(showId) {
    const items = readDb();
    return items.find(i => i.showId === Number(showId));
  },

  findById(id) {
    const items = readDb();
    return items.find(i => i.id === id);
  },

  create(data) {
    const items = readDb();
    const newItem = {
      id: Date.now().toString(),
      showId: Number(data.showId),
      title: data.title,
      imageUrl: data.imageUrl || null,
      genres: Array.isArray(data.genres) ? data.genres : [],
      status: data.status || 'Plan to Watch',
      userRating: Number(data.userRating) || 0.0,
      userNotes: data.userNotes || '',
      addedAt: new Date().toISOString(),
      updatedAt: new Date().toISOString()
    };
    items.unshift(newItem);
    writeDb(items);
    return newItem;
  },

  update(id, updates) {
    const items = readDb();
    const index = items.findIndex(i => i.id === id);
    if (index === -1) return null;

    items[index] = {
      ...items[index],
      status: updates.status !== undefined ? updates.status : items[index].status,
      userRating: updates.userRating !== undefined ? Number(updates.userRating) : items[index].userRating,
      userNotes: updates.userNotes !== undefined ? updates.userNotes : items[index].userNotes,
      updatedAt: new Date().toISOString()
    };
    writeDb(items);
    return items[index];
  },

  delete(id) {
    const items = readDb();
    const filtered = items.filter(i => i.id !== id);
    if (filtered.length === items.length) return false;
    writeDb(filtered);
    return true;
  }
};

module.exports = WatchlistModel;
