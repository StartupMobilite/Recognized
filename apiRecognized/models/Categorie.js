/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Categorie;
    Categorie = sequelize.define('Produit', {
        id_Categorie: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_Univers: DataTypes.INTEGER,
        value_Categorie: DataTypes.STRING
    });
    return Categorie;
};