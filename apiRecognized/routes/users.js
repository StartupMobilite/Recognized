var express = require('express');
var adresse = require('../controllers/Adresse.js');
var article = require('../controllers/Article.js');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/allUsers', AuthController.findAll );

module.exports = router;
