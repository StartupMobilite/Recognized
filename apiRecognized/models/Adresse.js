/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Adresse;
    Adresse = sequelize.define('Adresse', {
        id_Adresse: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        numero_Adresse: DataTypes.INTEGER,
        rue_Adresse: DataTypes.STRING,
        codePostal_Adresse: DataTypes.INTEGER,
        ville_Adresse: DataTypes.STRING,
        pays_Adresse: DataTypes.STRING
    });
    return Adresse;
};