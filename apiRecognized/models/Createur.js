/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Createur;
    Createur = sequelize.define('Createur', {
        id_Createur: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_User: DataTypes.INTEGER,
        nom_Marque: DataTypes.STRING,
        description_Marque: DataTypes.STRING,
        logo_Marque: DataTypes.STRING,
        id_Adresse: DataTypes.INTEGER
    });
    return Createur;
};