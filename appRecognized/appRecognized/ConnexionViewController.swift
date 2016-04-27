//
//  ConnexionViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 10/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class ConnexionViewController: UIViewController, NSFetchedResultsControllerDelegate {

    
    // MARK - IBOutlet
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var MainView: UIView!
    
    @IBOutlet weak var FormView: UIView!
    
    @IBOutlet weak var connexionButton: UIButton!
    
    let userdata = User()
    
    // MARK - Override View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ConnexionViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        //Initialize background
        MainView.backgroundColor = UIColor(patternImage: UIImage(named: "MainBackground")!)
        FormView.layer.cornerRadius = 8.5
        FormView.clipsToBounds = true
        //Cacher la navBar
        self.navigationController?.navigationBarHidden = true
        
        // Corner Raduis Img
        connexionButton.layer.cornerRadius = 8.95
        connexionButton.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
//        let personneTest = frc.fetchedObjects?.count
//        print(personneTest)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Action
    
    @IBAction func connexionAction(sender: AnyObject) {
        
        
        let user = self.userdata.findOneByEmailAndPassword(emailTextField.text!, password: passwordTextField.text!)
        print(user)
        if (user.valueForKey("error") == nil){
            
            if ((user["status"]) as! String == "createur"){
                
                session.setObject(user as NSDictionary, forKey: "user")
                
                let dataCreateur = Createur()
                let createur = dataCreateur.findOneByIdUser(user["id"] as! NSNumber)
                print("dataCreateur.findOneByIdUser --> \(createur)")
                
                if (createur["id"] != nil) {
                    session.setObject(createur as NSDictionary, forKey: "createur")
                    session.synchronize()
                }
                
                let tabBarCreateur = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarCreateur") as! UITabBarController
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                appDelegate.window?.rootViewController = tabBarCreateur
                
                
            }else if((user["status"]) as! String == "client"){
                
                let dataClient = Client()
                let client = dataClient.findOneByIdUser(user["id"] as! NSNumber)
                print("dataClient.findOneByUser \(client)")
                
                if ( client["idClient"] != nil){
                    session.setObject(client as NSDictionary, forKey: "createur")
                    session.synchronize()
                }
                
                let tabBarCreateur = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarCreateur") as! UITabBarController
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                
                appDelegate.window?.rootViewController = tabBarCreateur
                
            }else{
                displayAlert("Login Failes", message: "Email ou password incorrect !", titleAction: "OK")
            }
            
        }else{
            
           displayAlert("Login Failes", message: "Email ou password incorrect !", titleAction: "OK")
        }
    }
    
    
    func displayAlert(title: String, message: String, titleAction: String){
        
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: titleAction, style: UIAlertActionStyle.Default, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    
    //MARK - function
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    

   
     // MARK: - Navigation
    
//    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
//        
//        if (identifier == "goConnexion"){
//            print("goConnexion")
//            return true
//            
//        }else if ( identifier == "backStartApp"){
//            print("backStartApp")
//            return true
//        }
//        
//        return true
//    }
//
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "backStartApp"){
            let destController: StartAppViewController = segue.destinationViewController as! StartAppViewController
            
            destController.test = "perform segue";
            print(segue.identifier)
        }
        
     }
    

    
    
    
    
    
}
