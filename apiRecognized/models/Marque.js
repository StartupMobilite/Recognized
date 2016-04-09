/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Marque = sequelize.define('Marque', {
        id: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        libelle: DataTypes.STRING,
        logo: DataTypes.STRING,
        personne: DataTypes.INTEGER
    });
    return Marque;
};