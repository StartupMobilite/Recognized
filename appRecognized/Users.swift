//
//  Users.swift
//  appRecognized
//
//  Created by Karine Ould on 23/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Users: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
//    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    internal func insertNewUser(data : NSDictionary, entityDescription: NSEntityDescription, moc: NSManagedObjectContext){
//        
        let user = Users(entity: entityDescription, insertIntoManagedObjectContext: moc)
        
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

}
