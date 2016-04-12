//
//  Createur+CoreDataProperties.swift
//  appRecognized
//
//  Created by Karine Ould on 12/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Createurs {

    @NSManaged var descriptionMarque: String?
    @NSManaged var id: NSNumber?
    @NSManaged var idAdress: NSNumber?
    @NSManaged var idUser: NSNumber?
    @NSManaged var logoMarque: NSData?
    @NSManaged var nomMarque: String?

}
