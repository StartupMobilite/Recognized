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
        
        
        var paramUser:[String: AnyObject] = [ "nom": dataUser.nom as String!,
                           "prenom": dataUser.prenom as String!,
                           "email": dataUser.email as String!,
                           "password": dataUser.password as String!,
                           "status": dataUser.status as String!
        ]
        
        if (dataType is Createur){
            let dataCreateur = dataType as? Createur
            
             paramUser["marque"] = dataCreateur?.nomMarque as String!
             paramUser["description"] = dataCreateur?.description as String!

//             let imageData =
//             paramUser["logo"] = UIImageJPEGRepresentation((dataCreateur?.logo)!, 100)
//                imageData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0)) // encode the imagedataCreateur?.logo as NSData!
        }else{
            
            let dataClient = dataType as? Client
            paramUser["preference"] = dataClient?.universStyle
        }
        
        print("paramUser --> \(paramUser)")
        
        //Loader start
        indicator.startAnimating()
        
//        let imagePathUrl = NSURL(fileURLWithPath: paramUser["logo"]! as! String)
        
//        Alamofire.request(.POST, URL_API + "/createUser", multipartFormData: { multipartFormData in
//            multipartFormData.appendBodyPart(fileURL: imagePathUrl, name: "logo")},
//                
//            )
        
        Alamofire.request(.POST, URL_API + "/createUser", parameters: paramUser, encoding: .JSON)
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
                    checkIcon.hidden = false
                    nextButton.hidden = false
                    
                case .Failure(let error):
                    
                    self.resultData = ["error" : "request failed : \(error)"]
                    completionHandler(nil, error)
                    indicator.stopAnimating()
                    checkIcon.image = UIImage(named: "close")
                    checkIcon.hidden = false
                    nextButton.setTitle("Recommencer", forState: .Normal)
                    nextButton.hidden = false
                    
                }
                
        }
    }
    

}