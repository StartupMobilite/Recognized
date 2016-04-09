//
//  File.swift
//  appRecognized
//
//  Created by Karine Ould on 09/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit


class User {
    
    
    var id: String?
    var nom: String?
    var prenom: String?
    var email: String?
    var password: String?
    var status: String?

    
    init(nom: String,
         prenom: String,email: String, password: String, status: String) {
        self.nom = nom
        self.prenom = prenom
        self.email = email
        self.password = password
        self.status = status
    }
    
    init(){
        self.nom = String()
        self.prenom = String()
        self.email = String()
        self.password = String()
        self.status = String()
    }
    
    init(user : User){
        self.nom = user.nom
        self.prenom = user.prenom
        self.email = user.email
        self.password = user.password
        self.status = user.status
    }

}


class Createur : User {
    
    var description: String?
    var address : String?
    var telephone : String?
    var logo : NSData?
    
    init(nom: String,
         prenom: String,
         email: String,
         password: String,
         status: String,
         description: String,
         address : String,
         telephone : String,
         logo : NSData) {
        
        super.init(nom: nom, prenom: prenom, email: email, password: password, status: status)
        self.description = description
        self.address = address
        self.telephone = telephone
        self.logo = logo
    }
    
    override init() {
        super.init()
        self.description = String()
        self.address = String()
        self.telephone = String()
        self.logo = NSData()
    }
    
     init(userData: User) {
        super.init(user : userData)
        self.description = nil
        self.address = nil
        self.telephone = nil
        self.logo = nil
    }
    
//    func loadUser(userData: User) -> User{
//        return userData
//    }
}

class Client: User {

    var interest: NSArray
    
    init(nom: String,
         prenom: String,
         email: String,
         password: String,
         status: String,
         interest: NSArray) {
        self.interest = interest
        super.init(nom: nom, prenom: prenom, email: email, password: password, status: status)
    }
    
    init(userData: User) {
        self.interest = NSArray()
        super.init(user : userData)
    }

}

