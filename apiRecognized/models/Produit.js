/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Produit;
    Produit = sequelize.define('Produit', {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        reference: DataTypes.STRING,
        libelle: DataTypes.STRING,
        description: DataTypes.INTEGER,
        prix: DataTypes.FLOAT,
        quantite: DataTypes.INTEGER,
        marque: DataTypes.INTEGER,
        categorie: DataTypes.INTEGER,
        personne: DataTypes.INTEGER,
        pays: DataTypes.STRING
    });
    return Produit;
};