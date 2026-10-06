const express = require('express');
const router = express.Router();
const controller = require('../controllers/watchlistController');

router.get('/', controller.getWatchlist);
router.post('/', controller.createWatchlist);
router.put('/:id', controller.updateWatchlist);
router.delete('/:id', controller.deleteWatchlist);

module.exports = router;
