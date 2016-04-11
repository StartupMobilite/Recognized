/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Conversation;
    Conversation = sequelize.define('Conversation', {
        id_Conversation: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        id_User1: DataTypes.INTEGER,
        id_User2: DataTypes.INTEGER
    });
    return Conversation;
};