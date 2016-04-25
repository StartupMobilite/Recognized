/**
 * Created by Karine on 28/03/16.
 */

var models  = require('../models');
var fs = require("fs");

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

    console.log(req.file);

    var newUser = {
        nom_User: req.body.nom,
        prenom_User: req.body.prenom,
        email_User: req.body.email,
        password_User: req.body.password,
        status_User: req.body.status,
    };

    console.log(newUser);

    models.User.create(newUser).then(function(user) {

        var result = { 'error' : false };

        result["user"] = user.get('id_User') ? user.get() : false;

        if(result["user"]["status_User"] == "createur"){

            console.log('Creation de créateur');
            
            var newCreateur = {
                id_User: result["user"]["id_User"],
                nom_Marque: req.body.marque,
                description_Marque: req.body.description,
                // logo_Marque: req.body.logo
            };

            models.Createur.create(newCreateur).then(function(createur) {

                if (createur.get('id_Createur')) {

                    result["createur"] = createur.get();

                } else {

                    result['error'] = 'error insert createur';
                }
                res.send(result);
            });

        }else if(result["user"]["status_User"] == "client"){

            console.log('Creation du client');

            var newClient = {
                id_User: result["user"]["id_User"]
            };

            models.Client.create(newClient).then(function(client) {

                if (client.get('id_Client')) {

                    result["client"] = client.get();

                    console.log('Creation des préférences');

                    console.log(req.body.preference);
                    univers = req.body.preference;

                    if (Array.isArray(univers)){

                        var idUniver;

                        for ( idUniver in univers) {

                            console.log(univers[idUniver] != '');
                            if (univers[idUniver] != ''){

                                var newPreference = {
                                    id_Client: result["client"]["id_Client"],
                                    id_Univers: univers[idUniver]
                                };

                                console.log(newPreference);
                                models.Preference.create(newPreference).then(function(pref){

                                    if (pref.get('id')) {
                                        result["preference"] = true;
                                    }else {
                                        result['error'] = 'error insert preference';
                                    }

                                    console.log(result);
                                    res.send(result);
                                });
                            }
                        }
                    }else {
                        result['error'] = 'error insert preference (isArray)';
                    }
                } else {
                    result['error'] = 'error insert client';
                }
            });
        }else {
            result['error'] = 'type not defined'
        }
    });
};


exports.findAll = function(req, res, next) {
    models.User.findAll().then(function(users){
        console.log(users);
        return res.end(JSON.stringify(users));
        //res.send(users.array(models.User));
    });
}
