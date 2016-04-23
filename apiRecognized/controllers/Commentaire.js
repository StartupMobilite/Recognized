/**
 * Created by Ben on 13/04/2016.
 */
var models  = require('../models');

exports.addCommentaire = function(req, res, next) {
    console.log(req.body);

    var newCommentaire = {
        id_User: req.body.user,
        id_Article: req.body.article,
        value_Commentaire: req.body.comment
    };

    models.Commentaire.create(addCommentaire).then(function(commentaire) {
        result = commentaire.get();
        res.send(result);
    });

}
