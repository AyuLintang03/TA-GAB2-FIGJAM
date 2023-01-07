const router = require('express').Router();
const  produk  = require('../controllers').produk;

// GET localhost:3000/barang => Ambil data semua barang
router.get('/', produk.getDataProduk);

module.exports = router;