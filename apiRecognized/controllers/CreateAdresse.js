/**
 * Created by Ben on 13/04/2016.
 */
var models  = require('../models');

exports.createAdresse = function(req, res, next) {
    console.log(req.body);

    var newAdresse = {
        numero_Adresse: req.body.numero,
        rue_Adresse: req.body.rue,
        codePostal_Adresse: req.body.codePostal,
        ville_Adresse: req.body.ville,
        pays_Adresse: req.body.pays
    };

    models.Adresse.create(newAdresse).then(function(adresse) {
        var result = false;

        if (adresse.get('id_Adresse')) {
            result = adresse.get();
        } else {
            result = 'error insert adress';
        }

        res.send(result);
    });

}

exports.findAllAdresse = function(req, res, next) {

    return res.end(JSON.stringify(adresse));

}