//
//  MainVC.swift
//  appRecognized
//
//  Created by Karine Ould on 28/03/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class MainVC: UIViewController, NSFetchedResultsControllerDelegate {
    
    // MARK: Properties

    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var connexion: UIButton!
    
    
    
    
    
    // Retreive the managedObjectContext from AppDelegate
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    func fetchRequest() -> NSFetchRequest {
        
        let fetchRequest = NSFetchRequest(entityName: "Personnes")
        let sortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest

        
    }
    
    
    func getFRC () {//->  NSFetchedResultsController
        
        do {
            let personneResult = try moc.executeFetchRequest(fetchRequest()) as! [Users]
            
            personneResult.forEach({ (name) in
                print(name.nom)
            })
            
            print(personneResult.first?.email)
            
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
//        frc = NSFetchedResultsController(fetchRequest: fetchRequest(), managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
//        
//        return frc
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the background
        let backgroundColor = CIColor(red: 171, green: 130, blue: 255, alpha: 0.5)
        self.view.backgroundColor = UIColor.init(CIColor: backgroundColor)
//            UIColor(patternImage: UIImage(named: "blue-violet-blurry-background")!)
        
        
        
        //Cacher la navBar
        self.navigationController?.navigationBarHidden = true
        
        //        Alamofire.request(.GET, "http://localhost:3000/")
        //            .responseJSON { response in
        //                print(response.request)  // original URL request
        //                print(response.response) // URL response
        //                print(response.data)     // server data
        //                print(response.result)   // result of response serialization
        //
        //                if let JSON = response.result.value {
        //                    print("JSON: \(JSON)")
        //                }
        //        }
        
        //        sections?.count
        
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = true
        
        getFRC()
        
//        frc = getFRC()
//        frc.delegate = self
//        
//        do{
//            try frc.performFetch()
//            
//        }catch{
//            print("Failed to perform initial fetch")
//        }
        
//        print(frc)

        let personneTest = frc.fetchedObjects?.count

        
        print(personneTest)
//
//        print(personneTest.nom)
        
        
    }
    
    
    //MARK: - Helpers Methods
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
