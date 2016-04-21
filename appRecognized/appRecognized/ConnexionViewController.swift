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
        
        
        let user = self.userdata.findOneByEmailAndPassword("Users", email: emailTextField.text!, password: passwordTextField.text!)
        print(user)

        if ((user["email"]) != nil){
            
            print(user)
            let tabBarCreateur = self.storyboard?.instantiateViewControllerWithIdentifier("tabBarCreateur") as! UITabBarController
            
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.window?.rootViewController = tabBarCreateur

            
        }else{
            // create the alert
            let alert = UIAlertController(title: "Login failed", message: "Email ou password incorrect!", preferredStyle: UIAlertControllerStyle.Alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            // show the alert
            self.presentViewController(alert, animated: true, completion: nil)
        }
        
        
    }
    
    //MARK - function 
    func dismissKeyboard() {
        view.endEditing(true)
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

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    

    
    
    
    
    
}
