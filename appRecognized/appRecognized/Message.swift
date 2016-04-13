//
//  Message.swift
//  appRecognized
//
//  Created by Perinparajah Janany on 12/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData

class Message {
    
    var conversation: String?//Conversation?
    //        {
    //        get{
    //            if self.conversation == nil { return nil}
    //            return self.conversation
    //        }
    ////        set(newValue){
    ////            self.conversation = newValue
    ////        }
    //    }
    var expediteur: String?//User?
    //        {
    //        get{
    //            if self.expediteur == nil { return nil}
    //            return self.expediteur
    //        }
    ////        set(newValue){
    ////            self.expediteur = newValue
    ////        }
    //    }
    var destinataire: String?//User?
    //        {
    //        get{
    //            if self.destinataire == nil { return nil}
    //            return self.destinataire
    //        }
    ////        set(newValue){
    ////            self.destinataire = newValue
    ////        }
    //    }
    var contenu: String?
    //        {
    //        get{
    //            if self.contenu == nil { return nil}
    //            return self.contenu
    //        }
    ////        set(newValue){
    ////            self.contenu = newValue
    ////        }
    //    }
    var date: NSDate?
    //        {
    //        get{
    //            if self.date == nil { return nil}
    //            return self.date
    //        }
    ////        set(newValue){
    ////            self.date = newValue
    ////        }
    //    }
}

//class Conversation {
//    
//    var id: String?
//    //        {
//    //        get{
//    //            if self.id == nil { return nil}
//    //            return self.id
//    //        }
//    ////        set(newValue){
//    ////            self.id = newValue
//    ////        }
//    //    }
//    var user1: String?//User?
//    //        {
//    //        get{
//    //            if self.user1 == nil { return nil}
//    //            return self.user1
//    //        }
//    ////        set(newValue){
//    ////            self.user1 = newValue
//    ////        }
//    //    }
//    var user2: String//User?
//    //        {
//    //        get{
//    //            if self.user2 == nil { return nil}
//    //            return self.user2
//    //        }
//    ////        set(newValue){
//    ////            self.user2 = newValue
//    ////        }
//    //    }
//}


class CoupDeCoeur {
    
    var article: String?//Article?
    //        {
    //        get{
    //            if self.article == nil { return nil}
    //            return self.article
    //        }
    ////        set(newValue){
    ////            self.article = newValue
    ////        }
    //    }
    var user: String?//User?
    //        {
    //        get{
    //            if self.user == nil { return nil}
    //            return self.user
    //        }
    ////        set(newValue){
    ////            self.user = newValue
    ////        }
    //    }
}

class Interest {
    
    var client: String?//Client?
    //        {
    //        get{
    //            if self.client == nil { return nil}
    //            return self.client
    //        }
    ////        set(newValue){
    ////            self.client = newValue
    ////        }
    //    }
    var univers: String?//Univers?
    //        {
    //        get{
    //            if self.univers == nil { return nil}
    //            return self.univers
    //        }
    ////        set(newValue){
    ////            self.univers = newValue
    ////        }
    //    }

}

class Commentaire {
    
    var article: String?//Article?
    //        {
    //        get{
    //            if self.article == nil { return nil}
    //            return self.article
    //        }
    ////        set(newValue){
    ////            self.article = newValue
    ////        }
    //    }
    var user: String?//User?
    //        {
    //        get{
    //            if self.user == nil { return nil}
    //            return self.user
    //        }
    ////        set(newValue){
    ////            self.user = newValue
    ////        }
    //    }
    var value: String?
    //        {
    //        get{
    //            if self.value == nil { return nil}
    //            return self.value
    //        }
    ////        set(newValue){
    ////            self.value = newValue
    ////        }
    //    }
}

class Adresse {
    
    var id: String?
    //        {
    //        get{
    //            if self.id == nil { return nil}
    //            return self.id
    //        }
    ////        set(newValue){
    ////            self.id = newValue
    ////        }
    //    }
    var numero: Int?
    //        {
    //        get{
    //            if self.numero == nil { return nil}
    //            return self.numero
    //        }
    ////        set(newValue){
    ////            self.numero = newValue
    ////        }
    //    }
    var rue: String?
    //        {
    //        get{
    //            if self.rue == nil { return nil}
    //            return self.rue
    //        }
    ////        set(newValue){
    ////            self.rue = newValue
    ////        }
    //    }
    var codePostal: Int?
    //        {
    //        get{
    //            if self.codePostal == nil { return nil}
    //            return self.codePostal
    //        }
    ////        set(newValue){
    ////            self.codePostal = newValue
    ////        }
    //    }
    var pays: String?
    //        {
    //        get{
    //            if self.pays == nil { return nil}
    //            return self.pays
    //        }
    ////        set(newValue){
    ////            self.pays = newValue
    ////        }
    //    }
}