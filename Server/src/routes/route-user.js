const router = require('express').Router();
const  user  = require('../controllers').user;

// POST & GET localhost:3000/user/edit => Edit data User
router.post('/user/edit/:user_id', user.editDataUser);
router.get('/user/edit/:user_id', user.getDataUserByID);

// GEt localhost:3000/user/delete => Delete data User
router.get('/user/delete/:user_id', user.deleteDataUser);

module.exports = router;