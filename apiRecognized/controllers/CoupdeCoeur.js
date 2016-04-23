var models  = require('../models');

exports.addCoupDeCoeur = function(req, res, next) {
    console.log(req.body);

    var newCoupDeCoeur = {
        id_User: req.body.user,
        id_Article: req.body.article,
    };

    models.CoupDeCoeur.create(addCoupDeCoeur).then(function(coupDeCoeur) {
    	result = coupDeCoeur.get();
        res.send(result);
    });

}