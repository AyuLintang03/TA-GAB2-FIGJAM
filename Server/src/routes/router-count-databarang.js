const router = require('express').Router();
const countdatabarangController = require('../controllers').countdatabarang;

router.get('/', countdatabarangController.getCountDataProduk);
module.exports = router;