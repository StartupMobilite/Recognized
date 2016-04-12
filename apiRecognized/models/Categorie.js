/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Categorie;
    Categorie = sequelize.define('Categorie', {
        id_Categorie: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        id_Univers: DataTypes.INTEGER,
        value_Categorie: DataTypes.STRING
    });

    Categorie.sync({force: true}).then(function () {
        Categorie.create({id_Categorie: 1, id_Univers: 1, value_Categorie: 'Vêtements'});
        Categorie.create({id_Categorie: 2, id_Univers: 1, value_Categorie: 'Sacs & Accessoires'});
        Categorie.create({id_Categorie: 3, id_Univers: 1, value_Categorie: 'Chaussures'});
        Categorie.create({id_Categorie: 4, id_Univers: 1, value_Categorie: 'Lingerie & Bain'});

        Categorie.create({id_Categorie: 5, id_Univers: 2, value_Categorie: 'Vêtements'});
        Categorie.create({id_Categorie: 6, id_Univers: 2, value_Categorie: 'Sacs & Accessoires'});
        Categorie.create({id_Categorie: 7, id_Univers: 2, value_Categorie: 'Chaussures'});
        Categorie.create({id_Categorie: 8, id_Univers: 2, value_Categorie: 'Sous-vêtements & Bain'});

        Categorie.create({id_Categorie: 9, id_Univers: 3, value_Categorie: 'Filles'});
        Categorie.create({id_Categorie: 10, id_Univers: 3, value_Categorie: 'Garçons'});
        Categorie.create({id_Categorie: 11, id_Univers: 3, value_Categorie: 'Bébés'});
    });

    return Categorie;
};