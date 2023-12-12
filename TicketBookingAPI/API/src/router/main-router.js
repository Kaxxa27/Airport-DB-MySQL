const router = require('express').Router();

router.use('/auth', require('./auth-router'));
router.use('/user', require('./user-router'));
router.use('/passport', require('./passport-router'));

module.exports = router;