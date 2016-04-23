var models  = require('../models');

exports.createConversation = function(req, res, next) {
    console.log(req.body);

    var newConversation = {
        id_User1: req.body.user1,
        id_User2: req.body.user2
    };

    models.Conversation.create(newConversation).then(function(conversation) {
        var result = false;

        if (conversation.get('id_Conversation')) {
            result = conversation.get();
        } else {
            result = 'error insert adress';
        }

        res.send(result);
    });

}

exports.findAllConversation = function(req, res, next) {

    return res.end(JSON.stringify(conversation));

}