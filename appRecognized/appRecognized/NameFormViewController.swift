//
//  NameFormViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 04/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func isNom() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^([a-zA-Z'àâéèêôùûçÀÂÉÈÔÙÛÇ\\s-]{2,30})$",
                                             options: [.CaseInsensitive])
        
        return regex.firstMatchInString(self, options:[],
                                        range: NSMakeRange(0, utf16.count)) != nil
    }
}
class NameFormViewController: UIViewController {

    //MARK - Passing Data
    var dataUser = User()
    
    
    // MARK - IBOutlet

    @IBOutlet weak var prenomTextField: UITextField!
    
    @IBOutlet weak var nomTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet var testSegue: UISwipeGestureRecognizer!
    
    // MARK - Override View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(NameFormViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Corner Raduis Img
        nextButton.layer.cornerRadius = 7.0
        nextButton.clipsToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if (!(dataUser.nom?.isEmpty)!){
            nomTextField.text = dataUser.nom
        }
        if (!(dataUser.prenom?.isEmpty)!){
            prenomTextField.text = dataUser.prenom
        }
        
        toggleButtonNext()
        
    }
    
    // MARK - Action

    @IBAction func swipeEmailForm(sender: AnyObject) {
        shouldPerformSegueWithIdentifier("backEmailForm", sender: sender)
    }
    
    @IBAction func checkFullName(sender: AnyObject) {
        shouldPerformSegueWithIdentifier("goPasswordForm",sender: sender)
        
    }
    
    @IBAction func alreadyAccount(sender: AnyObject) {
    }
    
    
    @IBAction func prenomDidEndEditing(sender: AnyObject) {
        toggleButtonNext()
    }
    
    @IBAction func nomDidEndEditing(sender: AnyObject) {
        toggleButtonNext()
    }
    
    // MARK - Function
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func toggleButtonNext(){
        
        if (prenomTextField.text == "" || nomTextField.text == ""){
            nextButton.hidden = true
            descriptionTextView.hidden = false
        }else{
            nextButton.hidden = false
            descriptionTextView.hidden = true
            errorLabel.hidden = true
        }
    }
    
    // MARK: - Navigation
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        
        if (identifier == "goPasswordForm"){
            
            // Validation Email
            
            if ((nomTextField.text!.isNom()) != false || (nomTextField.text!.isNom()) != false){
                return true
            }else{
                nextButton.hidden = true
                descriptionTextView.hidden = true
                errorLabel.hidden = false
            }
            
        }else if (identifier == "backEmailForm"){
            return true
        }
        
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        dataUser.nom = nomTextField.text!
        dataUser.prenom = prenomTextField.text!
        
        if ( segue.identifier == "goPasswordForm"){
            let destViewController : PasswordFormViewController = segue.destinationViewController as! PasswordFormViewController
            
            destViewController.dataUser = dataUser
            
        }else if (segue.identifier == "backEmailForm"){
            let destViewController : EmailFormViewController = segue.destinationViewController as! EmailFormViewController

            destViewController.dataUser = dataUser

        }
        
        
    }

}




