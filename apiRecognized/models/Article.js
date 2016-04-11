/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Article;
    Article = sequelize.define('Article', {
        id_Article: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_Createur: DataTypes.INTEGER,
        titre_Article: DataTypes.STRING,
        description_Article: DataTypes.STRING,
        id_Produit: DataTypes.INTEGER
    });
    return Article;
};