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

    models.User.create(newUser).then(function(User) {
        var result = false;

        var result = { 'error' : false };

        result["user"] = user.get('id_User') ? user.get() : false;
        
        if(result["user"]["status_User"] == "createur"){

            console.log('Creation de créateur');

            var newCreateur = {
                id_User: result["user"]["id_User"],
                nom_Marque: req.body.marque,
                description_Marque: req.body.description,
                logo_Marque: req.body.logo
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
                if (client.get('id_User')) {

                    result["client"] = client.get();

                } else {
                    result['error'] = 'error insert client';
                }
                res.send(result);
            });
        }else {

            result['error'] = 'type not defind'
        }

        // res.send(result);
        //if (user.get('id_User')) {
        //    result = user.get();
        //} else {
        //    result = 'error insert user';
        //}
        //
        //res.send(result);
    });
};



exports.findAll = function(req, res, next) {
    models.User.findAll().then(function(users){
        console.log(users);
        return res.end(JSON.stringify(users));
        //res.send(users.array(models.User));
    });
}
