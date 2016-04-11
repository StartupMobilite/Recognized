/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Univers;
    Univers = sequelize.define('Univers', {
        id_Univers: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        value_Univers: DataTypes.STRING
    });
    return Univers;
};