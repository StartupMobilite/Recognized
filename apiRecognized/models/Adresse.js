/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Adresse;
    Adresse = sequelize.define('Adresse', {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        numeroVoie: DataTypes.INTEGER,
        nomVoie: DataTypes.STRING,
        codePostal: DataTypes.INTEGER,
        ville: DataTypes.STRING,
        pays: DataTypes.STRING
    });
    return Adresse;
};