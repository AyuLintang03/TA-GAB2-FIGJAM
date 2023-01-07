const router = require('express').Router();
const  produk  = require('../controllers').produk;

// POST & GET localhost:3000/produk/edit => Edit data 
router.post('/produk/edit/:id_produk', produk.editDataProduk);
router.get('/produk/edit/:id_produk', produk.getDataProdukID);

// POST & GET localhost:3000/produk/add => Tambah data produk ke database
router.post('/produk/add', produk.addDataProduk);
router.get('/produk/add', produk.addDataProdukID);

// GET localhost:3000/produk/delete => Delete data User
router.get('/produk/delete/:id_produk', produk.deleteDataProduk);

module.exports = router;