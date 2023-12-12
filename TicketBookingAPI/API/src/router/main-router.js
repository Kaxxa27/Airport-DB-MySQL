const router = require('express').Router();

router.use('/auth', require('./auth-router'));
router.use('/user', require('./user-router'));
router.use('/passport', require('./passport-router'));
router.use('/gender', require('./gender-router'));
router.use('/nationality', require('./nationality-router'));
router.use('/country', require('./country-router'));
router.use('/city', require('./city-router'));
router.use('/event', require('./event-router'));
router.use('/event-type', require('./event-type-router'));
router.use('/ticket', require('./ticket-router'));
router.use('/flight', require('./flight-router'));

module.exports = router;