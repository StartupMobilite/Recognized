/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var User;
    User = sequelize.define('User', {
        id_User: {
            type: DataTypes.INTEGER,
            allowNull: false,
            autoIncrement: true,
            primaryKey: true
        },
        nom_User: DataTypes.STRING,
        prenom_User: DataTypes.STRING,
        email_User: DataTypes.STRING,
        password_User: DataTypes.STRING,
        status_User: {
            type: DataTypes.ENUM,
            values: ['client', 'createur','admin'],
            // allowNull: false
        }
    });
    return User;
};