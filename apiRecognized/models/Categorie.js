/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Categorie;
    Categorie = sequelize.define('Produit', {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        libelle: DataTypes.STRING
    });
    return Categorie;
};