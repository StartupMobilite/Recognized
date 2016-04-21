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
        
        api.insertNewUserInApi(dataUser, dataType: dataCreateur, indicator: loaderIndicator, checkIcon : checkImg, nextButton : nextButton){ (responseObject, error) in
            
            let responseUser = responseObject?.valueForKey("user")
            print(responseUser)
            self.dataUser.insertNewUserInCoreData(responseUser! as! NSDictionary)
//              print(responseObject?.allValues)
              print(error)
            
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
