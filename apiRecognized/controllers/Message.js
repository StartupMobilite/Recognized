var models  = require('../models');

exports.createMessage = function(req, res, next) {
    console.log(req.body);

    var newMessage = {
        id_Conversation: req.body.conversation,
        id_Expediteur: req.body.expiditeur,
        id_Destinataire: req.body.destinataire,
        contenu_Message: req.body.contenu
    };

    models.Message.create(newMessage).then(function(message) {
        result = message.get();

        res.send(result);
    });

}

exports.findAllMessage = function(req, res, next) {

    return res.end(JSON.stringify(message));

}