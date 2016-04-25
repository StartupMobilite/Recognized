//
//  Article.swift
//  appRecognized
//
//  Created by Perinparajah Janany on 12/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData



class Article {

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
    var createur: String?//Createur?
    //        {
    //        get{
    //            if self.createur == nil { return nil}
    //            return self.createur
    //        }
    ////        set(newValue){
    ////            self.createur = newValue
    ////        }
    //    }
    var titre: String?
    //        {
    //        get{
    //            if self.titre == nil { return nil}
    //            return self.titre
    //        }
    ////        set(newValue){
    ////            self.titre = newValue
    ////        }
    //    }
    var description: String?
    //        {
    //        get{
    //            if self.description == nil { return nil}
    //            return self.description
    //        }
    ////        set(newValue){
    ////            self.description = newValue
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

class Univers {
    
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



class Categorie {
    
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

class Produit {
    
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
    var categorie: String?//Categorie?
    //        {
    //        get{
    //            if self.categorie == nil { return nil}
    //            return self.categorie
    //        }
    ////        set(newValue){
    ////            self.categorie = newValue
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



class Taille {
    
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
    var produit: String?//Produit?
    //        {
    //        get{
    //            if self.produit == nil { return nil}
    //            return self.produit
    //        }
    ////        set(newValue){
    ////            self.produit = newValue
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

