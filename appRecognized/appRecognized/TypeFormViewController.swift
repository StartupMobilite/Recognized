//
//  TypeFormViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 05/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class TypeFormViewController: UIViewController {

    //MARK - Passing Data
    var email = String()
    var nom = String()
    var prenom = String()
    var password = String()
    var status = String()
    
    
    // MARK - IBOutlet
    
   
    
    // MARK - Override View
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // MARK - Action
    
    
    // MARK - Function
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier)
        if ( segue.identifier == "goCreateurForm"){
            let destViewController : CreateurFormViewController = segue.destinationViewController as! CreateurFormViewController
            
            destViewController.email = email
            destViewController.nom = nom
            destViewController.prenom = prenom
            destViewController.password = password
            destViewController.status = "createur"
            
            
        }else if (segue.identifier == "goClientForm"){
            let destViewController : ClientFormViewController = segue.destinationViewController as! ClientFormViewController
            
            destViewController.email = email
            destViewController.nom = nom
            destViewController.prenom = prenom
            destViewController.password = password
            destViewController.status = "client"
            
        }else if (segue.identifier == "goBackPasswordForm"){
            let destViewController : PasswordFormViewController = segue.destinationViewController as! PasswordFormViewController
            
            destViewController.email = email
            destViewController.nom = nom
            destViewController.prenom = prenom
            destViewController.password = password
        }
        
    }

    
}
