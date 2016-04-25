/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Client;
    Client = sequelize.define('Client', {
        id_Client: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_User: DataTypes.INTEGER,
        id_Univers: DataTypes.INTEGER
    });
    return Client;
};