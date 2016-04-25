var express = require('express');
var bodyParser = require('body-parser');
var AuthController = require('../controllers/AuthenticateControllers.js');
var commentaire = require('../controllers/Commentaire.js');
var conversation = require('../controllers/Conversation.js');
var coupDeCoeur = require('../controllers/CoupdeCoeur.js');
var message = require('../controllers/Message.js');
var article = require('../controllers/Article.js');
var router = express.Router();

router.use(bodyParser.urlencoded({ extended: false }));



/* GET home page. */
router.get('/', function(req, res, next) {
    res.send('connected');
});



/* Create main user Admin. */
router.post('/createUserAdmin', AuthController.createUserAdmin );


/* Create an user client or createur. */
router.post('/createUser', AuthController.createUser );


router.post('/addCommentaire', commentaire.addCommentaire );

router.post('/createConversation', conversation.createConversation );


router.get('/findAll', AuthController.findAll );

router.get('/findAllArticle', article.findAllArticle);


module.exports = router;