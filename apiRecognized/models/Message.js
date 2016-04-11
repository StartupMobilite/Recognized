/**
 * Created by Ben on 11/04/2016.
 */
"use strict";

module.exports = function(sequelize, DataTypes) {
    var Message;
    Message = sequelize.define('Message', {
        id_Conversation: DataTypes.INTEGER,
        id_Expediteur: DataTypes.INTEGER,
        id_Destinataire: DataTypes.INTEGER,
        contenu_Message: DataTypes.STRING
    });
    return Message;
};