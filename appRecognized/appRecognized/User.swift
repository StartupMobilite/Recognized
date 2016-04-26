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

//extension String {
//    
//    func sha1() -> String {
//        let data = self.dataUsingEncoding(NSUTF8StringEncoding)!
//        var digest = [UInt8](count:Int(CC_SHA1_DIGEST_LENGTH), repeatedValue: 0)
//        CC_SHA1(data.bytes, CC_LONG(data.length), &digest)
//        let hexBytes = digest.map { String(format: "%02hhx", $0) }
//        return hexBytes.joinWithSeparator("")
//    }
//}
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
    
    internal func checkEmailUnicity (email: String) -> Bool {
        
        let fetchRequest = NSFetchRequest(entityName: "Users")
        fetchRequest.predicate = NSPredicate(format: "email == %@",email)
        
        do {
            let userResult = try moc.executeFetchRequest(fetchRequest) as! [Users]
            
            print("checkEmailUnicity Result : \(userResult.count)")
            
            if (userResult.count != 0){
                return false
            }
            
            return true
            
        }catch {
            
            fatalError("Failed to fetch user: \(error)")
        }
        
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
    
    internal func findOneByEmailAndPassword (email: String, password: String)-> NSDictionary{
        
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
    
    internal func insertInCoreData(data : NSDictionary){
        
        let entityDescritpion = NSEntityDescription.entityForName("Users", inManagedObjectContext: moc)
        
        let user = Users(entity: entityDescritpion!, insertIntoManagedObjectContext: moc)

        user.insertNewUser(data, entityDescription: entityDescritpion!, moc: moc)

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
    var logo : UIImage?
    
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
         logo : UIImage) {
        
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
        self.logo = UIImage()
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

    
    internal override func insertInCoreData(data : NSDictionary){
        
        let entityDescritpions = NSEntityDescription.entityForName("Createurs", inManagedObjectContext: moc)
        
        let createur = Createurs(entity: entityDescritpions!, insertIntoManagedObjectContext: moc)
        
        createur.insertNewCreateur(data, entityDescription: entityDescritpions!, moc: moc)
    }

    
    func fetchRequest(entityName: String, idUser: NSNumber) -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.predicate = predicateByidUser(idUser)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func predicateByidUser(idUser: NSNumber) -> NSPredicate{
        let predicateTest = NSPredicate(format: "idUser == %@", idUser)
        
        return predicateTest
    }
    
    internal func findOneByIdUser (idUser: NSNumber)-> NSDictionary{//->  NSFetchedResultsController
        
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
                data["logoMarque"] = createurResult.first?.logoMarque
                
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

    var universStyle: NSArray?
    
    init(id: String,
         nom: String,
         prenom: String,
         email: String,
         password: String,
         status: String,
         universStyle: NSArray) {
        self.universStyle = universStyle
        super.init(id: id, nom: nom, prenom: prenom, email: email, password: password, status: status)
    }
    
    init(userData: User) {
        self.universStyle = NSArray()
        super.init(user : userData)
    }
    
    override init() {
        super.init()
        self.universStyle = NSArray()
    }
    
    override func className()->String{
        return "Client"
    }
    
    internal override func insertInCoreData(data : NSDictionary){
        
        let entityDescritpions = NSEntityDescription.entityForName("Clients", inManagedObjectContext: moc)
        
        let client = Clients(entity: entityDescritpions!, insertIntoManagedObjectContext: moc)
        
        client.insertNewClient(data, entityDescription: entityDescritpions!, moc: moc)
    }
    
    
    func fetchRequest(entityName: String, idUser: NSNumber) -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: "idClient", ascending: true)
        fetchRequest.predicate = predicateByidUser(idUser)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    func predicateByidUser(idUser: NSNumber) -> NSPredicate{
        let predicateTest = NSPredicate(format: "idUser == %@", idUser)
        
        return predicateTest
    }

    internal func findOneByIdUser (idUser: NSNumber)-> NSDictionary{
        
        var data = Dictionary<String, AnyObject>()
        
        do {
            let clientResult = try moc.executeFetchRequest(fetchRequest("Clients", idUser: idUser)) as! [Clients]
            
            print("Result : \(clientResult.count)")
            
            clientResult.forEach({ (name) in
                print(name.idClient)
                print(name.idUser)
                print(name.universStyle)
                
            })
            
            if (clientResult.count == 1){
                data["idClient"] = (clientResult.first?.idClient)! as NSNumber
                data["idUser"] = (clientResult.first?.idUser)! as NSNumber
                data["universStyle"] = clientResult.first?.universStyle as! NSArray
               
                
                return data
                
            }else if (clientResult.count == 0){
                
                data["error"] = "no result"
                
                return data
            }else {
                data["error"] = "duplicate result \(clientResult.count)"
                
                return data
            }
            
        } catch {
            fatalError("Failed to fetch client: \(error)")
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

