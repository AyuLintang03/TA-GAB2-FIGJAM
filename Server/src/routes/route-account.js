const router = require('express').Router();
const  user  = require('../controllers').user;

// GET localhost:3000/user => Ambil data semua User
router.get('/', user.getDataUser);
router.get('/search', user.getDataUserSearch);

module.exports = router;