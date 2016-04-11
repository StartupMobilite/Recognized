/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var CoupDeCoeur;
    CoupDeCoeur = sequelize.define('CoupDeCoeur', {
        id_User: DataTypes.INTEGER,
        id_Article: DataTypes.INTEGER
    });
    return CoupDeCoeur;
};