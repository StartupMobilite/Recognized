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
    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    //MARK - Passing Data
    var dataUser = User()
    var dataUserCreateur = Createur()
    
    // MARK - IBOutlet
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var uploadButton: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
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
    
    override func viewDidAppear(animated: Bool) {
        
        print(dataUserCreateur.nom)
        if (dataUserCreateur.logo?.description != "<>"){
            logoImageView.image = UIImage(data : dataUserCreateur.logo!)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK - Action
    
    @IBAction func uploadButtonTap(sender: AnyObject) {
        
        let myPickerController = UIImagePickerController()
        
        myPickerController.delegate = self
        myPickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(myPickerController, animated:true, completion : nil)
        
        
    }
    

    @IBAction func backCreateurForm(sender: AnyObject) {
        shouldPerformSegueWithIdentifier("backCreateurForm", sender: sender)
    }
    
    // MARK - Function
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        logoImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        dataUserCreateur.logo = UIImagePNGRepresentation(logoImageView.image!)
        
        logoImageView.backgroundColor = UIColor.clearColor()
        
        self.dismissViewControllerAnimated(true , completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true , completion: nil)
        
    }
    
    func createNewUserInCoreData(dataUser : User){
        
        let entityDescritpion = NSEntityDescription.entityForName("Personnes", inManagedObjectContext: moc)
        
        let user = Users(entity: entityDescritpion!, insertIntoManagedObjectContext: moc)
        
        user.nom = dataUser.nom
        user.prenom = dataUser.prenom
        user.email = dataUser.email
        user.password = dataUser.password
        user.status = dataUser.status
        
        do{
            try moc.save()
            
        }catch{
            return
        }
    }


    
    // MARK: - Navigation
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        
        if (identifier == "goConnexion"){
            
            return true 
            
        }else if ( identifier == "backCreateurForm"){
            return true
        }
        
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        print(segue.identifier)
        if (segue.identifier == "goConnexion"){
            createNewUserInCoreData(dataUser)
            
//            let destViewController : ConnexionViewController = segue.destinationViewController as! ConnexionViewController
            
//            destViewController.dataCre = dataUser
            
        }else if (segue.identifier == "backCreateurForm"){
            
            let destViewController : CreateurFormViewController = segue.destinationViewController as! CreateurFormViewController
            
            dataUserCreateur.logo = UIImagePNGRepresentation(logoImageView.image!)
            destViewController.dataUserCreateur = dataUserCreateur
            
            
        }

    }
}
