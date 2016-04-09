//
//  Personnes+CoreDataProperties.swift
//  appRecognized
//
//  Created by Karine Ould on 28/03/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Personnes {

    @NSManaged var id: String?
    @NSManaged var nom: String?
    @NSManaged var prenom: String?
    @NSManaged var email: String?
    @NSManaged var password: String?
    @NSManaged var descriptions: String?
    @NSManaged var address: String?
    @NSManaged var telephone: String?
    @NSManaged var status: String?
    @NSManaged var image: NSData?

}
