/**
 * Created by Karine on 28/03/16.
 */

var models  = require('../models');


var sendJsonResponse = function (res, status, content) {
    res.status(status);
    res.json(content);
};

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

    models.User.create(newUser).then(function(user) {
        var result = false;

        if(user.get('status_User')=='createur'){
            console.log('Creation de créateur');
            var newCreateur = {
                id_User: user.get('id_User'),
                nom_Marque: req.body.marque,
                description_Marque: req.body.description,
                logo_Marque: req.body.logo
            };
            models.Createur.create(newCreateur).then(function(createur) {
                if (createur.get('id_User')) {
                    result = createur.get();
                } else {
                    result = 'error insert user';
                }

                res.send(result);
            });
        }

        if(user.get('status_User')=='client'){
            var newClient = {
                id_User: user.get('id_User')
            };
            models.Client.create(newClient).then(function(client) {
                if (client.get('id_User')) {
                    result = client.get();
                } else {
                    result = 'error insert user';
                }

                res.send(result);
            });
        }

    });
}


exports.findAll = function(req, res, next) {
    models.User.findAll().then(function(users){
        console.log(users);
        sendJsonResponse(res, 200, users);
        return;
    });
}
