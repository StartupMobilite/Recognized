//
//  PasswordFormViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 04/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

extension String {
    func isPassword() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{6,}$",
                                             options: [.CaseInsensitive])
        
        return regex.firstMatchInString(self, options:[],
                                        range: NSMakeRange(0, utf16.count)) != nil
    }
}

class PasswordFormViewController: UIViewController {
    
    
    //MARK - Passing Data
    var email = String()
    var nom = String()
    var prenom = String()
    var password = String()
    
    // MARK - IBOutlet
    
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK - Override View
    override func viewDidLoad() {
        super.viewDidLoad()

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PasswordFormViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Corner Raduis Img
        nextButton.layer.cornerRadius = 7.0
        nextButton.clipsToBounds = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        toggleButtonNext()
    }

    // MARK - Action
    
    @IBAction func passwordDidEndEditing(sender: AnyObject) {
        toggleButtonNext()
    }
    
    @IBAction func checkPassword(sender: AnyObject) {
        shouldPerformSegueWithIdentifier("goTypeForm",sender: sender)
    }
    
    
    @IBAction func swipeNameForm(sender: AnyObject) {
        shouldPerformSegueWithIdentifier("backNameForm",sender: sender)
    }
    
    // MARK - Function
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func toggleButtonNext(){
        
        if (passwordTextField.text == ""){
            nextButton.hidden = true
            descriptionTextView.hidden = false
            passwordErrorLabel.hidden = true
        }else{
            nextButton.hidden = false
            descriptionTextView.hidden = true
            passwordErrorLabel.hidden = true
        }
    }
    
    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        
        if (identifier == "goTypeForm"){
            
            // Validation Password
            
            if (passwordTextField.text!.characters.count > 5){
                return true
            }else{
                nextButton.hidden = true
                descriptionTextView.hidden = true
                passwordErrorLabel.hidden = false
            }
            
        }else if (identifier == "backNameForm"){
            return true
        }
        
        return false
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier)
        if ( segue.identifier == "goTypeForm"){
            let destViewController : TypeFormViewController = segue.destinationViewController as! TypeFormViewController
            
            destViewController.email = email
            destViewController.nom = nom
            destViewController.prenom = prenom
            destViewController.password = passwordTextField.text!
            
            
        }else if (segue.identifier == "backNameForm"){
            let destViewController : NameFormViewController = segue.destinationViewController as! NameFormViewController
            
            destViewController.email = email
            destViewController.nom = nom
            destViewController.prenom = prenom
            destViewController.password = passwordTextField.text!
    
            
        }

    }
    

}
