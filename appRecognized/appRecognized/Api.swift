//
//  Api.swift
//  appRecognized
//
//  Created by Karine Ould on 13/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class Api {

    var url : String?
    
    var param : NSArray?
    
    var resultData : NSDictionary?
    
    init(){
        self.url = ""
        self.param = []
        self.resultData = NSDictionary()
    }
    
    internal func insertNewUserInApi(dataUser: User, dataType: AnyObject ,indicator: UIActivityIndicatorView, checkIcon: UIImageView , nextButton: UIButton, msgIndicator: UITextView, completionHandler: (NSDictionary?, NSError?) -> ()){
        
        
        var paramUser = [ "nom": dataUser.nom as String!,
                           "prenom": dataUser.prenom as String!,
                           "email": dataUser.email as String!,
                           "password": dataUser.password as String!,
                           "status": dataUser.status as String!
        ]
        
        if (dataType is Createur){
            let dataCreateur = dataType as? Createur
             paramUser["marque"] = dataCreateur?.nomMarque
             paramUser["description"] = dataCreateur?.description
             paramUser["logo"] = String(dataCreateur?.logo)
        }else{
            
//            let dataClient = dataType as? Client
//            paramUser["interest"] = dataClient?.interest
        }
        
        //Loader start
        indicator.startAnimating()
        
        let test = URL_API + "/createUser"
        print(test)
        
        Alamofire.request(.POST, "http://192.168.0.5:3000/createUser", parameters: paramUser, encoding: .JSON)
            .responseJSON {
                response in switch response.result {
                case .Success(let JSON):
                    
                    let response = JSON as! NSDictionary
                    let userResponse = response.valueForKey("user")
                    
                    if (userResponse!.valueForKey("id_User") != nil && userResponse!.valueForKey("email_User")!.isEqual(dataUser.email))
                    {
                        self.resultData = response
                        completionHandler(response, nil)
                    }
                    indicator.stopAnimating()
                    msgIndicator.text = "Inscription réussi !"
                    checkIcon.hidden = false
                    nextButton.hidden = false
                    
                case .Failure(let error):
                    
                    self.resultData = ["error" : "request failed : \(error)"]
                    completionHandler(nil, error)
                    indicator.stopAnimating()
                    checkIcon.image = UIImage(named: "close")
                    checkIcon.hidden = false
                    nextButton.setTitle("Recommencer", forState: .Normal)
                    msgIndicator.text = "Oops ! Une erreur s'est produite !"
                    nextButton.hidden = false
                    
                }
                
        }
    }
    

}