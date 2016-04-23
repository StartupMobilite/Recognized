var models  = require('../models');

exports.createArticle = function(req, res, next) {
    console.log(req.body);

    var newArticle = {
        id_Createur: req.body.createur,
        titre_Article: req.body.titre,
        image_Article: req.body.image,
        description_Article: req.body.description,
        id_Produit: req.body.produit
    };

    models.Article.create(newArticle).then(function(article) {
        var result = false;

        if (article.get('id_Article')) {
            result = article.get();
        } else {
            result = 'error insert article';
        }

        res.send(result);
    });

}

exports.findAllArticle = function(req, res, next) {

    return res.end(JSON.stringify(article));

}