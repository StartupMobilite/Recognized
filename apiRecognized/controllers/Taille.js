var models  = require('../models');

exports.addTaille = function(req, res, next) {
    console.log(req.body);

    var newTaille = {
        id_Produit: req.body.produit,
        value_Taille: req.body.value
    };

    models.Taille.create(newTaille).then(function(taille) {
        var result = false;

        if (taille.get('id_Taille')) {
            result = taille.get();
        } else {
            result = 'error insert taille';
        }

        res.send(result);
    });

}

exports.findAllTaille = function(req, res, next) {

    return res.end(JSON.stringify(taille));

}