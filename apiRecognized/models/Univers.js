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
            primaryKey: true
        },
        value_Univers: DataTypes.STRING
    });

    Univers.sync({force: true}).then(function () {
        Univers.create({id_Univers: 1, value_Univers: 'Femmes'});
        Univers.create({id_Univers: 2, value_Univers: 'Hommes'});
        Univers.create({id_Univers: 3, value_Univers: 'Enfants'});

    });
    return Univers;
};