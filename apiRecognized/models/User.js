/**
 * Created by Karine on 23/03/16.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var User = sequelize.define("User", {
        username: DataTypes.STRING
    });

    return User;
};