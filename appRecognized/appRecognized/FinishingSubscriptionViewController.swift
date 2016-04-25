//
//  FinishingSubscriptionViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 13/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import Alamofire

class FinishingSubscriptionViewController: UIViewController {
    
    // MARK - IBOutlet
    
    @IBOutlet weak var loaderIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var msgIndicatorTextView: UITextView!
    
    @IBOutlet weak var checkImg: UIImageView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    //MARK - Passing Data
    var dataUser = User()
    var dataCreateur = Createur()
    var dataClient = Client()
    let api = Api()
    
    //MARK - action
    @IBAction func goConnexion(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
//        let connexionViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ConnexionViewController")
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        appDelegate.window?.rootViewController = connexionViewController
    }
    
    
    // MARK - Override View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Corner Raduis Img
        nextButton.layer.cornerRadius = 7.0
        nextButton.clipsToBounds = true
        
    }
    
    override func viewWillAppear(animated: Bool) {
//            print(dataUser)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //Check the type of the user to insert the right dataType
        let dataType = (dataUser.status == "createur" ? dataCreateur : dataClient)

//        dataUser.password?.sha1()
        
        //insert user into api : User , Createur/Client
        api.insertNewUserInApi(dataUser, dataType: dataType, indicator: loaderIndicator, checkIcon : checkImg, nextButton : nextButton, msgIndicator: msgIndicatorTextView){ (responseObject, error) in
                
            if (responseObject != nil && responseObject?.valueForKey("user") != nil){
                    
                print("RESPONSE --> \(responseObject)")
                
                let responseUser = responseObject?.valueForKey("user")
                self.dataUser.insertInCoreData(responseUser! as! NSDictionary)
                print("USER INSERT --> \(responseUser)")
                
                if (responseUser!["status_User"] as! String! == "createur"){
                    
                    let responseCreateur = responseObject?.valueForKey("createur")
                    self.dataCreateur.insertInCoreData(responseCreateur! as! NSDictionary)
                    print("CREATEUR INSERT --> \(responseCreateur)")
                    
                }else{
                    
                    var responseClient:[String: AnyObject] = responseObject?.valueForKey("client") as! [String : AnyObject]
                    responseClient["universStyle"] = self.dataClient.universStyle
                    self.dataClient.insertInCoreData(responseClient)
                    
                    print("CLIENT INSERT --> \(responseClient)")

                }
                    
            }else{
                print(error)
            }
        }
    }
    
//     override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
//        
//        if (identifier == "goConnexion"){
//            
////            dataUser.toString()
////            print(api.resultData)
//        }
//        return true
//    }
    

}
