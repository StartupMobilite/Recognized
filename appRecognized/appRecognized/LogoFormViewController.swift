//
//  LogoFormViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 09/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData

class LogoFormViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //MARK - Core Data 
    var users : Users? = nil
//    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    //MARK - Passing Data
    var dataUser = User()
    var dataUserCreateur = Createur()
    
    // MARK - IBOutlet
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    
    // MARK - Override View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Corner Raduis Img
        nextButton.layer.cornerRadius = 7.0
        nextButton.clipsToBounds = true
        
        uploadButton.layer.cornerRadius = 7.0
        uploadButton.clipsToBounds = true
        
        logoImageView.layer.cornerRadius = 43.0
        logoImageView.clipsToBounds = true 
        
    }
    
//    override func viewDidAppear(animated: Bool) {
//        
//        print(dataUserCreateur.nom)
//        if (dataUserCreateur.logo?.description != "<UIImage: 0x13ed9d3b0>, {0, 0}"){
//            logoImageView.image = dataUserCreateur.logo!
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    // MARK - Action
//    
//    @IBAction func uploadButtonTap(sender: AnyObject) {
//        
//        let myPickerController = UIImagePickerController()
//        
//        myPickerController.delegate = self
//        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
//        
//        self.presentViewController(myPickerController, animated:true, completion : nil)
//        
//        
//    }
//    
//
//    @IBAction func gofinishingSubscription(sender: AnyObject) {
//        
//        shouldPerformSegueWithIdentifier("goFinishSubscription", sender: sender)
//    }
//    
//    @IBAction func backCreateurForm(sender: AnyObject) {
//        shouldPerformSegueWithIdentifier("backCreateurForm", sender: sender)
//    }
//    
//    @IBAction func alreadyAccount(sender: AnyObject) {
//    }
//    
//    
//    // MARK - Function
//    
//    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        
//        logoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//        
//        dataUserCreateur.logo = logoImageView.image!
//        
//        logoImageView.backgroundColor = UIColor.clearColor()
//        
//        self.dismissViewControllerAnimated(true , completion: nil)
//        
//    }
//    
//    
//    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
//        self.dismissViewControllerAnimated(true , completion: nil)
//        
//    }
//    
//
//
//
//    
//    // MARK: - Navigation
//    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
//        
//        if (identifier == "goFinishSubscription"){
//            return true 
//            
//        }else if ( identifier == "backCreateurForm"){
//            return true
//        }
//        
//        return false
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        dataUserCreateur.logo = logoImageView.image!
//        
//        print(segue.identifier)
//        if (segue.identifier == "goFinishSubscription"){
//            
//            let destViewController : FinishingSubscriptionViewController = segue.destinationViewController as! FinishingSubscriptionViewController
//            
//            destViewController.dataUser = dataUser
//            destViewController.dataCreateur = dataUserCreateur
//            
//        }else if (segue.identifier == "backCreateurForm"){
//            
//            let destViewController : CreateurFormViewController = segue.destinationViewController as! CreateurFormViewController
//            
//            destViewController.dataUserCreateur = dataUserCreateur
//            
//            
//        }
//
//    }
}
