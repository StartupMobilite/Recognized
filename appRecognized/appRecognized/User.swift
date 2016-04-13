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
    
    internal func findOneByEmailAndPassword (entityName: String, email: String, password: String)-> NSDictionary{//->  NSFetchedResultsController
        
        var data = Dictionary<String, AnyObject>()
        
        do {
            let personneResult = try moc.executeFetchRequest(fetchRequest(entityName, email: email, password: password)) as! [Users]
            
            print("Result : \(personneResult.count)")
            
            if (personneResult.count == 1){
                data["id"] = (personneResult.first?.id)! as NSNumber
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
    
    
    internal func insertNewUserInCoreData(dataUser : User){
        
        
        let entityDescritpion = NSEntityDescription.entityForName("Users", inManagedObjectContext: moc)
        
        let user = Users(entity: entityDescritpion!, insertIntoManagedObjectContext: moc)
        
//        let dataUserApi = insertNewUserInApi(dataUser)
        user.id = Int(dataUser.id!)
        user.nom = dataUser.nom
        user.prenom = dataUser.prenom
        user.email = dataUser.email
        user.password = dataUser.password
        user.status = dataUser.status
        
        do{
            try moc.save()
            
        }catch{
            return
        }
    }
    
    func insertNewUserInApi(indicator: UIActivityIndicatorView, completionHandler: (NSDictionary?, NSError?) -> ()) {
        
        let parameters = [ "nom": self.nom as String!,
                           "prenom": self.prenom as String!,
                           "email": self.email as String!,
                           "password": self.password as String!,
                           "status": self.status as String!
        ]
        
       indicator.startAnimating()
       Alamofire.request(.POST, "http://localhost:3000/createUser", parameters: parameters, encoding: .JSON)
            .responseJSON {
                response in switch response.result {
                case .Success(let JSON):
//                    print("Success with JSON: \(JSON)")
                    
                    let response = JSON as! NSDictionary
                    
                    if ((response["id"]) != nil && (response["email"]?.isEqual(self.email))!)
                    {
                        completionHandler(JSON as? NSDictionary, nil)
                
                    }
                case .Failure(let error):
                    
//                    print("Request failed with error: \(error)")
                    completionHandler(nil, error)

                }
                indicator.stopAnimating()
    
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
    
    override func className()->String{
        return "Createur"
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
    
    override func className()->String{
        return "Client"
    }
}

