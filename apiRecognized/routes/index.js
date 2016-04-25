var express = require('express');
var bodyParser = require('body-parser');
var AuthController = require('../controllers/AuthenticateControllers.js');
var router = express.Router();
var multer = require('multer');
var fileUpload = require('express-fileupload');
var app = express();
var upload = multer({
    dest: 'uploads/',
});

router.use(bodyParser.urlencoded({ extended: false }));

// default options
app.use(fileUpload());

/* GET home page. */
router.get('/', function(req, res, next) {
    res.send('connected');
});

router.get('/index', function(req, res){
    res.render('index', { title: 'Express' });
});


router.get('/upload',function(req, res){
    res.render('upload', { title: 'Express' });
});

router.post('/upload', upload.single('img'), function(req, res) {

});


/* Create main user Admin. */
router.post('/createUserAdmin', AuthController.createUserAdmin );


/* Create an user client or createur. */
router.post('/createUser', upload.single('logo'), AuthController.createUser );


router.get('/allUsers', AuthController.findAll );




//router.post('/upload', function(req, res) {
//    console.log(req.body); //form fields
//    console.log(req.file); //form files
//    res.status(204).end();
//});

module.exports = router;