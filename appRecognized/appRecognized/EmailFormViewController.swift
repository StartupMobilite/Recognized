//
//  EmailFormViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 03/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

extension String {

    func isEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,4}$",
                                             options: [.CaseInsensitive])
        
        return regex.firstMatchInString(self, options:[],
                                        range: NSMakeRange(0, utf16.count)) != nil
    }
}

class EmailFormViewController: UIViewController, UITextFieldDelegate {

    //MARK - Passing Data 
    var dataUser = User()    

    
    // MARK - IBOutlet
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    

    // MARK - Override View
    override func viewDidLoad() {
        super.viewDidLoad()

        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EmailFormViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Corner Raduis Img
        nextButton.layer.cornerRadius = 7.0
        nextButton.clipsToBounds = true
    
    }

    override func viewDidAppear(animated: Bool) {
        
        if (!(dataUser.email?.isEmpty)!){
            emailTextField.text = dataUser.email
        }
        
        toggleButtonNext()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK - Action

    @IBAction func emailDidEndEditing(sender: AnyObject) {
        
        toggleButtonNext()
        
    }
    
    @IBAction func checkEmail(sender: AnyObject) {
        shouldPerformSegueWithIdentifier("goNameForm",sender: sender)
    }
    
    @IBAction func swipeConditionGeneral(sender: AnyObject) {
        
        shouldPerformSegueWithIdentifier("backConditionGeneral", sender: sender)
    }
    
    @IBAction func alreadyAccount(sender: AnyObject) {
    }
    // MARK - Function

    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func toggleButtonNext(){
        
        if (emailTextField.text == ""){
            nextButton.hidden = true
            descriptionTextView.hidden = false
            emailErrorLabel.hidden = true
        }else{
            nextButton.hidden = false
            descriptionTextView.hidden = true
            emailErrorLabel.hidden = true
        }
    }

     // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        
        if (identifier == "goNameForm"){
            
            // Validation Email 
            
            if ((emailTextField.text!.isEmail()) != false && dataUser.checkEmailUnicity(emailTextField.text!)){
                return true
            }else{
                nextButton.hidden = true
                descriptionTextView.hidden = true
                emailErrorLabel.hidden = false
            }
        
        }else if ( identifier == "backConditionGeneral"){
            return true
        }
       
        return false
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier)
        if (segue.identifier == "goNameForm"){
            
            let destViewController : NameFormViewController = segue.destinationViewController as! NameFormViewController
            
            dataUser.email = emailTextField.text!
            destViewController.dataUser = dataUser
            
        }
    
    }
   

}
