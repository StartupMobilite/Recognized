/**
 * Created by Karine on 28/03/16.
 */

var models  = require('../models');

exports.createUserAdmin = function(req, res, next){

    console.log(req.body);
    
    var newUser = {
        nom: req.body.nom,
        prenom: req.body.prenom,
        email: req.body.email,
        password: req.body.password,
        statut: 'admin'
    };

    models.Personne.create(newUser).then(function(user){

        var result = false;

        if (user.get('id')){
            result = user.get();

        }else{
            result = 'error insert user';
        }

        res.send(result);
    });


};
