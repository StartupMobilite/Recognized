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
    
    
    // MARK - Override View
    
    override func viewWillAppear(animated: Bool) {
//            print(dataUser)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let api = Api()
        
        api.insertNewUserInApi(dataUser, dataType: dataCreateur, indicator: loaderIndicator, checkIcon : checkImg, nextButton : nextButton){ responseObject, error in
            
              print(responseObject)
              print(error)
            
            }
    }
    

}
