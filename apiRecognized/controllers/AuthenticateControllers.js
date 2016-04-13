/**
 * Created by Karine on 28/03/16.
 */

var models  = require('../models');

exports.createUserAdmin = function(req, res, next){

    console.log(req.body);
    
    var newUser = {
        nom_User: req.body.nom,
        prenom_User: req.body.prenom,
        email_User: req.body.email,
        password_User: req.body.password,
        status_User: 'admin'
    };

    models.User.create(newUser).then(function(User){

        var result = false;

        if (User.get('id_User')){
            result = User.get();

        }else{
            result = 'error insert user';
        }

        res.send(result);
    });


};

exports.createUser = function(req, res, next) {
    console.log(req.body);

    var newUser = {
        nom_User: req.body.nom,
        prenom_User: req.body.prenom,
        email_User: req.body.email,
        password_User: req.body.password,
        status_User: req.body.status,
    };

    console.log(newUser);

    models.User.create(newUser).then(function(User) {
        var result = false;

        if (User.get('id_User')) {
            result = User.get();
        } else {
            result = 'error insert user';
        }

        res.send(result);
    });

}

