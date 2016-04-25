//
//  Client.swift
//  appRecognized
//
//  Created by Karine Ould on 12/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import Foundation
import CoreData


class Clients: NSManagedObject {
    
    
    internal func insertNewClient(data : NSDictionary, entityDescription: NSEntityDescription, moc: NSManagedObjectContext){
        
        //
        let client = Clients(entity: entityDescription, insertIntoManagedObjectContext: moc)
        
        client.idClient = data.valueForKey("id_Client") as? Int
        client.idUser = data.valueForKey("id_User") as? Int
        client.universStyle = data.valueForKey("universStyle") as? NSArray
        
        do{
            try moc.save()
            
        }catch{
            return
        }
        
    }
    
    
}
