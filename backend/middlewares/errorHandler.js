exports.notFound = (req, res, next) => {
  res.status(404).json({ error: `Route ${req.originalUrl} tidak ditemukan` });
};

exports.errorHandler = (err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Terjadi kesalahan internal pada server' });
};
