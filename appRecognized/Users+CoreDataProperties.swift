//
//  Users+CoreDataProperties.swift
//  appRecognized
//
//  Created by Karine Ould on 23/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Users {

    @NSManaged var email: String?
    @NSManaged var id: NSNumber?
    @NSManaged var nom: String?
    @NSManaged var password: String?
    @NSManaged var prenom: String?
    @NSManaged var status: String?

}
