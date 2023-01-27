const router = require('express').Router();
const countdatauserController = require('../controllers').countdatauser;

router.get('/', countdatauserController.getCountDataUser);
module.exports = router;