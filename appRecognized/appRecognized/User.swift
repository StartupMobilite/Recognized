//
//  File.swift
//  appRecognized
//
//  Created by Karine Ould on 09/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class User {
    
    // Retreive the managedObjectContext from AppDelegate
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
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
    var prenom: String?
    var email: String?
    var password: String?
    var status: String?

    
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
    
    func className()->String{
        return "User"
    }
    
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
    
    internal func findOneByEmailAndPassword (email: String, password: String)-> NSDictionary{//->  NSFetchedResultsController
        
        var data = Dictionary<String, AnyObject>()
        
        do {
            let userResult = try moc.executeFetchRequest(fetchRequest("Users", email: email, password: password)) as! [Users]
            
            print("Result : \(userResult.count)")
            print(userResult.description)
            
            userResult.forEach({ (name) in
                print(name.id)
                print(name.email)
                print(name.password)
            })
            
            if (userResult.count == 1){
                data["id"] = (userResult.first?.id)! as NSNumber
                data["nom"] = userResult.first?.nom
                data["prenom"] = userResult.first?.prenom
                data["email"] = userResult.first?.email
                data["password"] = userResult.first?.password
                data["status"] = userResult.first?.status
                
                print(data)
                return data
            }else if (userResult.count == 0){
            
                data["error"] = "no result"
                
                return data
            }else {
                data["error"] = "duplicate result \(userResult.count)"
                
                return data
            }
           
            
        } catch {
            fatalError("Failed to fetch user: \(error)")
        }
    }
    
    internal func insertNewInCoreData(data : NSDictionary){
        
        let entityDescritpion = NSEntityDescription.entityForName("Users", inManagedObjectContext: moc)
        
        let user = Users(entity: entityDescritpion!, insertIntoManagedObjectContext: moc)
        
        user.id = data.valueForKey("id_User") as? Int
        user.nom = data.valueForKey("nom_User") as? String
        user.prenom = data.valueForKey("prenom_User") as? String
        user.email = data.valueForKey("email_User") as? String
        user.password = data.valueForKey("password_User") as? String
        user.status = data.valueForKey("status_User") as? String

        
        do{
            try moc.save()
            
        }catch{
            return
        }
    }
    
    internal func toString(){
        
        print("id : \(self.id)")
        print("nom : \(self.nom)")
        print("prenom : \(self.prenom)")
        print("email : \(self.email)")
        print("password : \(self.password)")
        print("status : \(self.status)")
        
        
    }
}


class Createur : User {
    
    var nomMarque : String?
    var description: String?
    var address : String?
    var telephone : String?
    var logo : NSData?
    
//    // Retreive the managedObjectContext from AppDelegate
//    let mocCreateur = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
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
    
    override func className()->String{
        return "Createur"
    }
//    func loadUser(userData: User) -> User{
//        return userData
//    }
    
    internal override func insertNewInCoreData(data : NSDictionary){
        
        let entityDescritpions = NSEntityDescription.entityForName("Createurs", inManagedObjectContext: moc)
        
        let createur = Createurs(entity: entityDescritpions!, insertIntoManagedObjectContext: moc)
        
        createur.id = data.valueForKey("id_Createur") as? Int
        createur.idUser = data.valueForKey("id_User") as? Int
        createur.nomMarque = data.valueForKey("nom_Marque") as? String
        createur.descriptionMarque = data.valueForKey("description_Marque") as? String
//        createur.logoMarque = data.valueForKey("logo_Marque") as? String
       
        
        do{
            try moc.save()
            
        }catch{
            return
        }
    }

    
    func fetchRequest(entityName: String, idUser: Int) -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: "nom", ascending: true)
        fetchRequest.predicate = predicateByidUser(idUser)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func predicateByidUser(idUser: Int) -> NSPredicate{
        let predicateTest = NSPredicate(format: "idUser == %@", idUser)
        
        return predicateTest
    }
    
    internal func findOneByIdUser (idUser: Int)-> NSDictionary{//->  NSFetchedResultsController
        
        var data = Dictionary<String, AnyObject>()
        
        do {
            let createurResult = try moc.executeFetchRequest(fetchRequest("Createurs", idUser: idUser)) as! [Createurs]
            
            print("Result : \(createurResult.count)")
            
            createurResult.forEach({ (name) in
                print(name.id)
                print(name.idUser)
                print(name.nomMarque)
                
            })
            
            if (createurResult.count == 1){
                data["id"] = (createurResult.first?.id)! as NSNumber
                data["idUser"] = (createurResult.first?.idUser)! as NSNumber
                data["nomMarque"] = createurResult.first?.nomMarque
                data["descriptionMarque"] = createurResult.first?.descriptionMarque
//                data["logoMarque"] = createurResult.first?.logoMarque
                
                return data
            }else if (createurResult.count == 0){
                
                data["error"] = "no result"
                
                return data
            }else {
                data["error"] = "duplicate result \(createurResult.count)"
                
                return data
            }
            
        } catch {
            fatalError("Failed to fetch user: \(error)")
        }
    }

    
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
    
    override func className()->String{
        return "Client"
    }
}

