/**
 * Created by Ben on 23/03/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Produit;
    Produit = sequelize.define('Produit', {
        id_Produit: {
            type: DataTypes.INTEGER,
            allowNull: false,
            primaryKey: true
        },
        id_Categorie: DataTypes.INTEGER,
        value_Produit: DataTypes.STRING
    });

    Produit.sync({force: true}).then(function () {
        // Univers Femmes & Catégorie Vêtements
        Produit.create({id_Produit: 1, id_Categorie: 1, value_Produit: 'Chemises'});
        Produit.create({id_Produit: 2, id_Categorie: 1, value_Produit: 'Jeans'});
        Produit.create({id_Produit: 3, id_Categorie: 1, value_Produit: 'Jupes'});
        Produit.create({id_Produit: 4, id_Categorie: 1, value_Produit: 'Maille'});
        Produit.create({id_Produit: 5, id_Categorie: 1, value_Produit: 'Pantalons'});
        Produit.create({id_Produit: 6, id_Categorie: 1, value_Produit: 'Robes'});
        Produit.create({id_Produit: 7, id_Categorie: 1, value_Produit: 'Shorts & Pantacourts'});
        Produit.create({id_Produit: 8, id_Categorie: 1, value_Produit: 'T-shirts, Polos & Hauts'});
        Produit.create({id_Produit: 9, id_Categorie: 1, value_Produit: 'Vestes & Manteaux'});


        // Univers Femmes & Catégorie Sacs & Accessoires
        Produit.create({id_Produit: 10, id_Categorie: 2, value_Produit: 'Sacs'});
        Produit.create({id_Produit: 11, id_Categorie: 2, value_Produit: 'Portefeuilles'});
        Produit.create({id_Produit: 12, id_Categorie: 2, value_Produit: 'Echarpes & Foulards'});
        Produit.create({id_Produit: 13, id_Categorie: 2, value_Produit: 'Chapeaux'});
        Produit.create({id_Produit: 14, id_Categorie: 2, value_Produit: 'Ceintures'});
        Produit.create({id_Produit: 15, id_Categorie: 2, value_Produit: 'Etuis & Pochettes'});

        // Univers Femmes & Catégorie Chaussures
        Produit.create({id_Produit: 16, id_Categorie: 3, value_Produit: 'Baskets & Sneakers'});
        Produit.create({id_Produit: 17, id_Categorie: 3, value_Produit: 'Ballerines'});
        Produit.create({id_Produit: 18, id_Categorie: 3, value_Produit: 'Nu-pieds'});
        Produit.create({id_Produit: 19, id_Categorie: 3, value_Produit: 'Derbies & Richelieus'});
        Produit.create({id_Produit: 20, id_Categorie: 3, value_Produit: 'Escarpins'});
        Produit.create({id_Produit: 21, id_Categorie: 3, value_Produit: 'Bottes & Bottines'});

        // Univers Femmes & Catégorie Lingerie & Bain
        Produit.create({id_Produit: 22, id_Categorie: 4, value_Produit: 'Soutiens-gorges'});
        Produit.create({id_Produit: 23, id_Categorie: 4, value_Produit: 'Culottes & Bas'});
        Produit.create({id_Produit: 24, id_Categorie: 4, value_Produit: 'Collants'});
        Produit.create({id_Produit: 25, id_Categorie: 4, value_Produit: 'Homewear'});
        Produit.create({id_Produit: 26, id_Categorie: 4, value_Produit: 'Body'});
        Produit.create({id_Produit: 27, id_Categorie: 4, value_Produit: 'Maillots de bain'});

        // Univers Hommes & Catégorie Vêtements
        Produit.create({id_Produit: 28, id_Categorie: 5, value_Produit: 'Chemises'});
        Produit.create({id_Produit: 29, id_Categorie: 5, value_Produit: 'Vestes & Manteaux'});
        Produit.create({id_Produit: 30, id_Categorie: 5, value_Produit: 'T-shirts & Polos'});
        Produit.create({id_Produit: 31, id_Categorie: 5, value_Produit: 'Pantalons'});
        Produit.create({id_Produit: 32, id_Categorie: 5, value_Produit: 'Costumes'});
        Produit.create({id_Produit: 33, id_Categorie: 5, value_Produit: 'Pulls & Gilets'});
        Produit.create({id_Produit: 34, id_Categorie: 5, value_Produit: 'Jeans'});
        Produit.create({id_Produit: 35, id_Categorie: 5, value_Produit: 'Shorts & Bermudas'});

        // Univers Hommes & Catégorie Sacs & Accessoires
        Produit.create({id_Produit: 35, id_Categorie: 6, value_Produit: 'Sacs'});
        Produit.create({id_Produit: 36, id_Categorie: 6, value_Produit: 'Portefeuilles'});
        Produit.create({id_Produit: 37, id_Categorie: 6, value_Produit: 'Echarpes & Foulards'});
        Produit.create({id_Produit: 38, id_Categorie: 6, value_Produit: 'Chapeaux'});
        Produit.create({id_Produit: 39, id_Categorie: 6, value_Produit: 'Ceintures'});
        Produit.create({id_Produit: 40, id_Categorie: 6, value_Produit: 'Cravates'});

        // Univers Hommes & Catégorie Chaussures
        Produit.create({id_Produit: 41, id_Categorie: 7, value_Produit: 'Baskets & Sneakers'});
        Produit.create({id_Produit: 42, id_Categorie: 7, value_Produit: 'Ville'});
        Produit.create({id_Produit: 43, id_Categorie: 7, value_Produit: 'Bottes & Bottines'});
        Produit.create({id_Produit: 44, id_Categorie: 7, value_Produit: 'Chaussures Montantes'});

        // Univers Hommes & Catégorie Sous-vêtements & Bain
        Produit.create({id_Produit: 45, id_Categorie: 8, value_Produit: 'Sous-vêtements'});
        Produit.create({id_Produit: 46, id_Categorie: 8, value_Produit: 'Homewear'});
        Produit.create({id_Produit: 47, id_Categorie: 8, value_Produit: 'Maillots de bain'});
        Produit.create({id_Produit: 48, id_Categorie: 8, value_Produit: 'Chaussettes'});

        // Univers Enfants & Catégorie Filles
        Produit.create({id_Produit: 49, id_Categorie: 9, value_Produit: 'Vestes & Manteaux'});
        Produit.create({id_Produit: 50, id_Categorie: 9, value_Produit: 'Robes & Jupes'});
        Produit.create({id_Produit: 51, id_Categorie: 9, value_Produit: 'Pulls & Gilets'});
        Produit.create({id_Produit: 52, id_Categorie: 9, value_Produit: 'T-shirts, Blouses & Chemises'});
        Produit.create({id_Produit: 53, id_Categorie: 9, value_Produit: 'Jeans'});
        Produit.create({id_Produit: 54, id_Categorie: 9, value_Produit: 'Pantalons'});
        Produit.create({id_Produit: 55, id_Categorie: 9, value_Produit: 'Shorts'});

        // Univers Enfants & Catégorie Garçons
        Produit.create({id_Produit: 56, id_Categorie: 10, value_Produit: 'Vestes & Manteaux'});
        Produit.create({id_Produit: 57, id_Categorie: 10, value_Produit: 'Shorts & Bermudas'});
        Produit.create({id_Produit: 58, id_Categorie: 10, value_Produit: 'Pulls & Gilets'});
        Produit.create({id_Produit: 59, id_Categorie: 10, value_Produit: 'T-shirts & Chemises'});
        Produit.create({id_Produit: 60, id_Categorie: 10, value_Produit: 'Jeans'});
        Produit.create({id_Produit: 61, id_Categorie: 10, value_Produit: 'Pantalons'});

        // Univers Enfants & Catégorie Bébés
        Produit.create({id_Produit: 62, id_Categorie: 11, value_Produit: 'Vestes & Manteaux'});
        Produit.create({id_Produit: 63, id_Categorie: 11, value_Produit: 'Ensembles'});
        Produit.create({id_Produit: 64, id_Categorie: 11, value_Produit: 'Pulls & Gilets'});
        Produit.create({id_Produit: 65, id_Categorie: 11, value_Produit: 'T-shirts & Chemises'});
        Produit.create({id_Produit: 66, id_Categorie: 11, value_Produit: 'Pantalons'});
        Produit.create({id_Produit: 67, id_Categorie: 11, value_Produit: 'Robes & Jupes'});
        Produit.create({id_Produit: 68, id_Categorie: 11, value_Produit: 'Shorts & Bermudas'});
        Produit.create({id_Produit: 69, id_Categorie: 11, value_Produit: 'Pyjamas'});
        Produit.create({id_Produit: 70, id_Categorie: 11, value_Produit: 'Chaussures'});
    });

    return Produit;
};