//
//  Clients+CoreDataProperties.swift
//  appRecognized
//
//  Created by Karine Ould on 24/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Clients {

    @NSManaged var idClient: NSNumber?
    @NSManaged var idUser: NSNumber?
    @NSManaged var universStyle: NSObject?

}
