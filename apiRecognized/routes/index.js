var express = require('express');
var bodyParser = require('body-parser');
var AuthController = require('../controllers/AuthenticateControllers.js');
var router = express.Router();
var multer = require('multer');
var upload = multer({dest : '../public/images/'});

router.use(bodyParser.urlencoded({ extended: false }));



/* GET home page. */
router.get('/', function(req, res, next) {
    res.send('connected');
});



/* Create main user Admin. */
router.post('/createUserAdmin', AuthController.createUserAdmin );


/* Create an user client or createur. */
router.post('/createUser', upload.single('logo'), AuthController.createUser );


router.get('/allUsers', AuthController.findAll );

module.exports = router;