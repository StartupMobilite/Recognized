/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Preference;
    Preference = sequelize.define('Preference', {
        id_Client: DataTypes.INTEGER,
        id_Univers: DataTypes.INTEGER
    });
    return Preference;
};