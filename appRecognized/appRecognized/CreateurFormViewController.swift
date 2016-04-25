//
//  CreateurFormViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 06/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class CreateurFormViewController: UIViewController, UITextViewDelegate {

    //MARK - Passing Data
    var dataUser = User()
    var dataUserCreateur = Createur()


    // MARK - IBOutlet
    
    @IBOutlet weak var nameMarqueTextTield: UITextField!

    @IBOutlet weak var descriptionMarqueTextView: UITextView!

    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var descriptionTextView: UITextView!

    // MARK - Override View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CreateurFormViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Corner Raduis Img
        nextButton.layer.cornerRadius = 7.0
        nextButton.clipsToBounds = true
        
        //init TextView
        descriptionMarqueTextView.delegate = self
        descriptionMarqueTextView.layer.borderColor = UIColor(red: 198.0/255.0, green: 198.0/255.0, blue: 200.0/255.0, alpha: 1.0).CGColor
        descriptionMarqueTextView.layer.borderWidth = 1.0
        descriptionMarqueTextView.layer.cornerRadius = 5
        descriptionMarqueTextView.text = "Description"
        descriptionMarqueTextView.textColor = UIColor(red: 186.0/255.0, green: 185.0/255.0, blue: 194.0/255.0, alpha: 1.0)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        if (!dataUserCreateur.nomMarque!.isEmpty){
            nameMarqueTextTield.text = dataUserCreateur.nomMarque
        }
        if (!dataUserCreateur.description!.isEmpty){
            descriptionMarqueTextView.textColor = UIColor(red: 134.0/255.0, green: 11.0/255.0, blue: 65.0/255.0, alpha: 1.0)

            descriptionMarqueTextView.text = dataUserCreateur.description
        }
        
        toggleButtonNext()
        
    }
    
    
    // MARK - Action
    @IBAction func nameMarqueDidEndEditing(sender: AnyObject) {
        toggleButtonNext()
        
    }
    
    @IBAction func swipeTypeForm(sender: AnyObject) {
        
        shouldPerformSegueWithIdentifier("backTypeForm", sender: sender)
    }
    
    @IBAction func alreadyAccount(sender: AnyObject) {
    }
    
    // MARK - Function
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func toggleButtonNext(){
        
        if (nameMarqueTextTield.text == "" || descriptionMarqueTextView.text == "Description"){
            nextButton.hidden = true
            descriptionTextView.hidden = false
        }else{
            nextButton.hidden = false
            descriptionTextView.hidden = true
        }
    }
    
    internal func textViewDidBeginEditing(textView: UITextView) {
        if textView.textColor == UIColor(red: 186.0/255.0, green: 185.0/255.0, blue: 194.0/255.0, alpha: 1.0) {
            textView.text = ""
            textView.textColor = UIColor(red: 134.0/255.0, green: 11.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        }
    }
    
    internal func textViewDidEndEditing(textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Description"
            textView.textColor = UIColor(red: 186.0/255.0, green: 185.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        }
        toggleButtonNext()
    }

    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        
        if (identifier == "goFinishSubscription"){
            return true
            
            
        }else if (identifier == "backTypeForm"){
            print("backTypeForm")
            return true
        }
        
        return false
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if ( segue.identifier == "goFinishSubscription"){
            let destViewController : FinishingSubscriptionViewController = segue.destinationViewController as! FinishingSubscriptionViewController
            
            dataUserCreateur.nomMarque = nameMarqueTextTield.text!
            dataUserCreateur.description = descriptionMarqueTextView.text!
            destViewController.dataUser = dataUser
            destViewController.dataCreateur = dataUserCreateur
            
        }else if (segue.identifier == "backTypeForm"){
            let destViewController : TypeFormViewController = segue.destinationViewController as! TypeFormViewController
            
            destViewController.dataUser = dataUser

        }
        
        
    }

    
}
