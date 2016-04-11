/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Taille;
    Taille = sequelize.define('Taille', {
        id_Taille: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_Produit: DataTypes.INTEGER,
        value_Taille: DataTypes.STRING
    });
    return Taille;
};