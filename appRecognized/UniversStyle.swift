//
//  UniversStyle.swift
//  appRecognized
//
//  Created by Karine Ould on 23/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class UniversStyle: NSManagedObject {


    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func fetchRequest(entityName: String) -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: "idUnivers", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }
    
    internal func getAllUnivers ()-> NSDictionary{//->  NSFetchedResultsController
        
        var data = Dictionary<String, AnyObject>()
        
        do {
            let universResult = try moc.executeFetchRequest(fetchRequest("UniversStyle")) as! [UniversStyle]
            
            print("Result : \(universResult.count)")
            
            if ( universResult.count > 0){
            
            universResult.forEach({ (name) in
                data["idUnivers"] = name.idUnivers
                data["valueUnivers"] = name.valueUnivers
                
            })
            
                return data
            
            }else {
                data["error"] = "\(universResult.count)"
                
                return data
            }
            
        } catch {
            fatalError("Failed to fetch univers: \(error)")
        }
    }


}
