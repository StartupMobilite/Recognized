//
//  ViewController.swift
//  Recognized
//
//  Created by Karine Ould on 02/12/2015.
//  Copyright © 2015 Karine Ould. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    // MARK: Properties

    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.emailTextField.
        
//        emailTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


//    // MARK: UITextFieldDelegate
//    func text
    
    // MARK: Actions
//    
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

