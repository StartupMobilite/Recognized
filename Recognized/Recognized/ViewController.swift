//
//  ViewController.swift
//  Recognized
//
//  Created by Karine Ould on 02/12/2015.
//  Copyright © 2015 Karine Ould. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController  {
    
    // MARK: Properties

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    let moc = DataController().managedObjectContext
    
    let personne = [
        1 : ["Ben", "Nikiema", "sidbey", "040888", 1],
        2 : ["Janany", "Perinparajah", "janany23", "Thamay31", 1],
        3 : ["Karine", "Ould", "karine19", "melon", 1],
        4 :  ["client", "client", "client", "client", 0],
    ]
    
    let defaut = NSUserDefaults.standardUserDefaults()
    
    func fetch(){
        
        let personFetch = NSFetchRequest(entityName: "Personne")
        
        do{
            let fetchPerson = try moc.executeFetchRequest(personFetch) as! [Personne]
            
            print(fetchPerson.first!.firstname)
            print(fetchPerson.first!.lastname)
        
        }catch{
            fatalError("bad things happened : \(error)")
        }
        
    }
    
    func seedPerson(){
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Personne", inManagedObjectContext: moc) as! Personne
        
        entity.setValue("Karine", forKey: "firstname")
        entity.setValue("Ould", forKey: "lastname")
        entity.setValue("karine19", forKey: "pseudo")
        entity.setValue("melon", forKey: "password")
        entity.setValue(1, forKey: "isadmin")
        
        for (index, element) in personne.enumerate() {
            
           print("Item \(index): \(element)")
//            for(i,userData) in index.
        }
        
        do {
            try moc.save()
        }catch{
            fatalError("Can't save the entity manager: \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seedPerson()
        fetch()
    }

    // MARK: Actions
    
    @IBAction func connexionLabel (sender: UIButton){
        
        let email = emailTextField.text
        let password = passwordTextField.text
        
        if (email == "karine" && password == "karine"){

            self.performSegueWithIdentifier("isSignIn", sender: self)
            
        }else{
            
            let alertController = UIAlertController(title: "ERREUR", message:"LOGIN OU PASSWORD INCORRECT !"
                , preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    
    }

}

