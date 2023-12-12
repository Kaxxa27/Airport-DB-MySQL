const router = require('express').Router();

router.use('/auth', require('./auth-router'));
router.use('/user', require('./user-router'));
router.use('/passport', require('./passport-router'));
router.use('/gender', require('./gender-router'));
router.use('/nationality', require('./nationality-router'));

module.exports = router;