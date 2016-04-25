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
    var dataUser = User()

    // MARK - IBOutlet
    
   
    
    // MARK - Override View
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // MARK - Action
    
    @IBAction func alreadyAccount(sender: AnyObject) {
    }
    
    // MARK - Function
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
        print(segue.identifier)
        if ( segue.identifier == "goCreateurForm"){
            let destViewController : CreateurFormViewController = segue.destinationViewController as! CreateurFormViewController
            
            dataUser.status = "createur"
            destViewController.dataUser = dataUser
        
            
        }else if (segue.identifier == "goClientForm"){
            let destViewController : ClientFormViewController = segue.destinationViewController as! ClientFormViewController
            
            dataUser.status = "client"
            destViewController.dataUser = dataUser
           
            
        }else if (segue.identifier == "goBackPasswordForm"){
            let destViewController : PasswordFormViewController = segue.destinationViewController as! PasswordFormViewController
            
            destViewController.dataUser = dataUser
           
        }
        
    }

    
}
