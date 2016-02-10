//
//  ClientRegistrationViewController.swift
//  Recognized
//
//  Created by Perinparajah Janany on 10/02/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

extension String {
    func isNom() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^([a-zA-Z]{1,30})$",
            options: [.CaseInsensitive])
        
        return regex.firstMatchInString(self, options:[],
            range: NSMakeRange(0, utf16.count)) != nil
    }
    
    func isEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$",
            options: [.CaseInsensitive])
        
        return regex.firstMatchInString(self, options:[],
            range: NSMakeRange(0, utf16.count)) != nil
    }
}

class ClientRegistrationViewController: UIViewController {

    
    
    @IBOutlet weak var nomTextField: UITextField!
    
    @IBOutlet weak var prenomTextField: UITextField!
    
    @IBOutlet weak var telephoneTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var pseudoTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var passwordConfTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clientSignUp(sender: UIButton) {
        let nom = nomTextField.text
        //        let prenom= prenomTextField.text
        //        let telephone = telephoneTextField.text
        //        let email = emailTextField.text
        //        let password = passwordTextField.text
        //        let passwordConf = passwordConfTextField.text
        
        if ((nom?.isNom()) != nil){
            signUpButton.enabled = true
            self.performSegueWithIdentifier("signUpOk", sender: self)
        }else{
            
            let alertController = UIAlertController(title: "ERREUR", message:"NOM INCORRECTE !"
                , preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }

        
    }
    
    

}
