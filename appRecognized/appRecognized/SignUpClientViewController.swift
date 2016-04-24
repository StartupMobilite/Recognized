//
//  SignUpClientViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 02/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData

class SignUpClientViewController: UIViewController, NSFetchedResultsControllerDelegate, UINavigationControllerDelegate {
    
    
    var personnes : Users? = nil
    
    @IBOutlet weak var personnePrenom: UITextField!
    @IBOutlet weak var personneNom: UITextField!
    @IBOutlet weak var personneEmail: UITextField!
    @IBOutlet weak var personnePassword: UITextField!
    
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    
    //MARK - Action Button
    
    
    @IBAction func saveSignUp(sender: AnyObject) {
        
        createNewPersonne()
        
        dismissVC()
    }
    
    
    @IBAction func cancelSignUp(sender: AnyObject) {
        dismissVC()
    }
    
    func dismissVC() {
    
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    func createNewPersonne(){
        
        let entityDescritpion = NSEntityDescription.entityForName("Users", inManagedObjectContext: moc)
        
        let personne = Users(entity: entityDescritpion!, insertIntoManagedObjectContext: moc)
        
//        personne.nom = personneNom.text
//        personne.prenom = personnePrenom.text
//        personne.email = personneEmail.text
//        personne.password = personnePassword.text
        
        
        do{
            try moc.save()
            
        }catch{
            return
        }
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
}
