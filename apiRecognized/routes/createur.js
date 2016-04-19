var express = require('express');
var bodyParser = require('body-parser');
var adresse = require('../controllers/Adresse.js');
var router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));

/* Creer un adresse au createur. */
router.post('/addAdress', adresse.createAdresse);

module.exports = router;