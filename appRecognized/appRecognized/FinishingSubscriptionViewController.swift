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
    let api = Api()
    
    //MARK - action
    @IBAction func goConnexion(sender: AnyObject) {
    }
    
    
    // MARK - Override View
    
    override func viewWillAppear(animated: Bool) {
//            print(dataUser)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        api.insertNewUserInApi(dataUser, dataType: dataCreateur, indicator: loaderIndicator, checkIcon : checkImg, nextButton : nextButton, msgIndicator: msgIndicatorTextView){ (responseObject, error) in
            
            if (responseObject != nil){
                
                let responseUser = responseObject?.valueForKey("user")
                let responseCreateur = responseObject?.valueForKey("createur")
                print(responseUser)
                print(responseCreateur)
                self.dataUser.insertNewInCoreData(responseUser! as! NSDictionary)
                self.dataCreateur.insertNewInCoreData(responseCreateur! as! NSDictionary)
    
            }else{
              print(error)
            }
        }
        
    }
    
     override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        
        if (identifier == "goConnexion"){
            
//            dataUser.toString()
//            print(api.resultData)
        }
        return true
    }
    

}
