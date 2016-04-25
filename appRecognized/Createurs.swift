//
//  Createur.swift
//  appRecognized
//
//  Created by Karine Ould on 12/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import Foundation
import CoreData


class Createurs: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    internal func insertNewCreateur(data : NSDictionary, entityDescription: NSEntityDescription, moc: NSManagedObjectContext){
        //
        let createur = Createurs(entity: entityDescription, insertIntoManagedObjectContext: moc)
        
        createur.id = data.valueForKey("id_Createur") as? Int
        createur.idUser = data.valueForKey("id_User") as? Int
        createur.nomMarque = data.valueForKey("nom_Marque") as? String
        createur.descriptionMarque = data.valueForKey("description_Marque") as? String
//                createur.logoMarque = data.valueForKey("logo_Marque") as? String
        
        
        do{
            try moc.save()
            
        }catch{
            return
        }
    }


}
