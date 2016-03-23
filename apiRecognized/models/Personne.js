/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Personne;
    Personne = sequelize.define('Personne', {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        nom: DataTypes.STRING,
        prenom: DataTypes.STRING,
        email: DataTypes.STRING,
        password: DataTypes.STRING,
        description: DataTypes.STRING,
        adresse: DataTypes.INTEGER,
        telephone: DataTypes.INTEGER,
        statut: {
            type: DataTypes.ENUM,
            values: ['client', 'createur'],
            allowNull: false
        }
    });
    return Personne;
};