//
//  Personne+CoreDataProperties.swift
//  Recognized
//
//  Created by Karine Ould on 10/02/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Personne {

    @NSManaged var lastname: String?
    @NSManaged var firstname: String?
    @NSManaged var pseudo: String?
    @NSManaged var password: String?
    @NSManaged var isadmin: NSNumber?

}
