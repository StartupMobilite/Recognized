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
    
    let personne = [
        ("sidbey","040888",1),
        ("janany23","Thamay31",1),
        ("karine", "melon",1),
        ("client","client",0)
    ]
    
    let defaut = NSUserDefaults.standardUserDefaults()
    
    
    func seedPerson(){
        let moc = DataController().managedObjectContext
        
        let entity = NSEntityDescription.insertNewObjectForEntityForName("Personne", inManagedObjectContext: moc) as! Personne
        
        entity.setValue("Karine", forKey: "firstname")
        entity.setValue("Ould", forKey: "lastname")
        entity.setValue("karine19", forKey: "pseudo")
        entity.setValue("melon", forKey: "password")
        entity.setValue(1, forKey: "isadmin")
        
        do {
            try moc.save()
        }catch{
            fatalError("Can't save the entity manager: \(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seedPerson()
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

