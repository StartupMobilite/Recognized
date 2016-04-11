/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Commentaire;
    Commentaire = sequelize.define('Commentaire', {
        id_User: DataTypes.INTEGER,
        id_Article: DataTypes.INTEGER,
        value_Commentaire: DataTypes.STRING
    });
    return Commentaire;
};