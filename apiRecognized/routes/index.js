var express = require('express');
var bodyParser = require('body-parser');
var AuthController = require('../controllers/AuthenticateControllers.js');
var router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));



/* GET home page. */
router.get('/', function(req, res, next) {
    res.send('connected');
});



/* Create main user Admin. */
router.post('/createUserAdmin', AuthController.createUserAdmin );

module.exports = router;
