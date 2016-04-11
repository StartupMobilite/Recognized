/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Produit;
    Produit = sequelize.define('Produit', {
        id_Produit: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_Categorie: DataTypes.INTEGER,
        value_Produit: DataTypes.STRING
    });
    return Produit;
};