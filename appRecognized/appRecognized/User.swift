//
//  File.swift
//  appRecognized
//
//  Created by Karine Ould on 09/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData


class User {
    
    
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
    var nom: String?
//        {
//        get{
//            if self.nom == nil { return nil}
//            return self.nom
//        }
////        set(newValue){
////            self.nom = newValue
////        }
//    }
    var prenom: String?
//        {
//        get{
//            if self.prenom == nil { return nil}
//            return self.prenom
//        }
////        set(newValue){
////            self.prenom = newValue
////        }
//    }
    var email: String?
//        {
//        get{
//            if self.email == nil { return nil}
//            return self.email
//        }
////        set(newValue){
////            self.email = newValue
////        }
//    }
    var password: String?
//        {
//        get{
//            if self.password == nil { return nil}
//            return self.password
//        }
////        set(newValue){
////            self.password = newValue
////        }
//    }
    var status: String?
//    {
//        get{
//            if self.status == nil { return nil}
//            return self.status
//        }
////        set(newValue){
////            self.status = newValue
////        }
//    }
    
    init(id: String, nom: String,
         prenom: String,email: String, password: String, status: String) {
        self.id = id
        self.nom = nom
        self.prenom = prenom
        self.email = email
        self.password = password
        self.status = status
    }
    
    init(){
        self.id = String()
        self.nom = String()
        self.prenom = String()
        self.email = String()
        self.password = String()
        self.status = String()
    }
    
    init(user : User){
        self.id = user.id
        self.nom = user.nom
        self.prenom = user.prenom
        self.email = user.email
        self.password = user.password
        self.status = user.status
    }
    
    
    // Retreive the managedObjectContext from AppDelegate
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    func fetchRequest(entityName: String, email: String, password: String) -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: "nom", ascending: true)
        fetchRequest.predicate = predicateByEmailAndPassword(email, password: password)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func predicateByEmailAndPassword(email: String!, password: String!) -> NSPredicate{
        let predicateTest = NSPredicate(format: "email == %@ AND password == %@",email, password)
        
        return predicateTest
    }
    
    internal func findOneByEmailAndPassword (entityName: String, email: String, password: String)-> NSDictionary{//->  NSFetchedResultsController
        
        var data = Dictionary<String, String>()
        
        do {
            let personneResult = try moc.executeFetchRequest(fetchRequest(entityName, email: email, password: password)) as! [Personnes]
            
            print("Result : \(personneResult.count)")
            
            if (personneResult.count == 1){
                data["id"] = personneResult.first?.id
                data["nom"] = personneResult.first?.nom
                data["prenom"] = personneResult.first?.prenom
                data["email"] = personneResult.first?.email
                data["password"] = personneResult.first?.password
                data["status"] = personneResult.first?.status
                
                return data
            }else if (personneResult.count == 0){
            
                data["error"] = "no result"
                
                return data
            }else {
                data["error"] = "duplicate result \(personneResult.count)"
                
                return data
            }
//            personneResult.forEach({ (name) in
//                print(name.email)
//                print(name.password)
//            })
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }


}


class Createur : User {
    
    var nomMarque : String?
    var description: String?
    var address : String?
    var telephone : String?
    var logo : NSData?
    
    init(id: String,
         nom: String,
         prenom: String,
         email: String,
         password: String,
         status: String,
         nomMarque : String,
         description: String,
         address : String,
         telephone : String,
         logo : NSData) {
        
        super.init(id: id, nom: nom, prenom: prenom, email: email, password: password, status: status)
        self.nomMarque = nomMarque
        self.description = description
        self.address = address
        self.telephone = telephone
        self.logo = logo
    }
    
    override init() {
        super.init()
        self.nomMarque = String()
        self.description = String()
        self.address = String()
        self.telephone = String()
        self.logo = NSData()
    }
    
     init(userData: User) {
        super.init(user : userData)
        self.nomMarque = nil
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
    
    init(id: String,
         nom: String,
         prenom: String,
         email: String,
         password: String,
         status: String,
         interest: NSArray) {
        self.interest = interest
        super.init(id: id, nom: nom, prenom: prenom, email: email, password: password, status: status)
    }
    
    init(userData: User) {
        self.interest = NSArray()
        super.init(user : userData)
    }

}

