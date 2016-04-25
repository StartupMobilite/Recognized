var express = require('express');
var commentaire = require('../controllers/Commentaire.js');
var conversation = require('../controllers/Conversation.js');
var coupDeCoeur = require('../controllers/CoupdeCoeur.js');
var message = require('../controllers/Message.js');
var AuthController = require('../controllers/AuthenticateControllers.js');
var router = express.Router();

/* GET users listing. */
router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

router.get('/allUsers', AuthController.findAll );

router.post('/addCommentaire', commentaire.addCommentaire);

router.post('/createConversation', conversation.createConversation);

router.post('/addCoupDeCoeur', coupDeCoeur.addCoupDeCoeur);

router.post('/createMessage', message.createMessage);

module.exports = router;
