var express = require('express');
var bodyParser = require('body-parser');
var AuthController = require('../controllers/AuthenticateControllers.js');
var article = require('../controllers/Article.js');
var router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));



/* GET home page. */
router.get('/', function(req, res, next) {
    res.send('connected');
});

//router.get('/allUser', AuthController.findAllUser);


/* Create main user Admin. */
router.post('/createUserAdmin', AuthController.createUserAdmin );


/* Create an user client or createur. */
router.post('/createUser', AuthController.createUser );


router.post('/addCommentaire', AuthController.addCommentaire );

router.post('/createConversation', AuthController.createaddConversation );


router.get('/findAll', AuthController.findAll );

router.get('/findAllArticle', Article.allArticle);


module.exports = router;