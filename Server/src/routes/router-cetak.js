const router = require('express').Router();
const cetakController = require('../controllers').cetak;

router.get('/', cetakController.cetak);
module.exports = router;