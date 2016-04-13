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
    
    var requestEnd : Bool
    
    init(){
        self.url = ""
        self.param = []
        self.resultData = NSDictionary()
        self.requestEnd = false
    }
    
    internal func insertNewUserInApi(dataUser: User, dataType: AnyObject ,indicator: UIActivityIndicatorView, checkIcon: UIImageView , nextButton: UIButton, completionHandler: (NSDictionary?, NSError?) -> ()) {
        
        
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
        
        Alamofire.request(.POST, "http://10.75.3.179:3000/createUser", parameters: paramUser, encoding: .JSON)
            .responseJSON {
                response in switch response.result {
                case .Success(let JSON):
                    
                    let response = JSON as! NSDictionary
                    
                    if ((response["id"]) != nil && (response["email"]?.isEqual(dataUser.email))!)
                    {
                        completionHandler(response, nil)
                    }
                    indicator.stopAnimating()
                    checkIcon.hidden = false
                    nextButton.hidden = false
                    self.requestEnd = true
                    
                case .Failure(let error):
                    
                    completionHandler(nil, error)
                    indicator.stopAnimating()
                    checkIcon.hidden = false
                    nextButton.hidden = false
                    self.requestEnd = true
                    
                }
                
        }
    }
    

}