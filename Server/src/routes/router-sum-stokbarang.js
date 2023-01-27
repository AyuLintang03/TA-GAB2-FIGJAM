const router = require('express').Router();
const sumdatabarangController = require('../controllers').sumdatabarang;

router.get('/', sumdatabarangController.getSumDataProduk);
module.exports = router;