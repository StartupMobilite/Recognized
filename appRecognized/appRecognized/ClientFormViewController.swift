//
//  ClientFormViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 06/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class ClientFormViewController: UIViewController {

    //MARK - Passing Data
    var dataUser = User()
    var dataClient = Client()
    
    // MARK - IBOutlet
    
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var DescriptionTextView: UITextView!
    
    @IBOutlet weak var checkboxWomen: Checkbox!
    
    @IBOutlet weak var checboxMen: Checkbox!
    
    @IBOutlet weak var checkboxChildren: Checkbox!
    
    @IBOutlet weak var checkboxAll: Checkbox!
    
    // MARK - Override View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Corner Raduis Img
    nextButton.layer.cornerRadius = 7.0
    nextButton.clipsToBounds = true
    
    }
    
    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(<#T##animated: Bool##Bool#>)
        
        dataUser.toString()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK - Action

    
    
    
    // MARK - Function
    
//    func toggleButtonNext(){
//        
//        if (noCheckboxChecked()){
//            nextButton.hidden = true
//            DescriptionTextView.hidden = false
//        }else{
//            nextButton.hidden = false
//            DescriptionTextView.hidden = true
//        }
//    }
    
    func noCheckboxChecked() -> Bool{
        
        if (!checkboxAll.isChecked && !checkboxChildren.isChecked && !checkboxWomen.isChecked && !checboxMen.isChecked ){
            return true
        }
        
        return false
    }
    
    func checkboxToArray() -> NSArray{
        
        //order : women, men, child
        var array = NSArray()
        
        if (checkboxAll.isChecked){
            array = ["1", "2", "3"]
        
        }else{
            array = [(checkboxWomen.isChecked ? "1" : ""), (checboxMen.isChecked ? "2" : ""), (checkboxChildren.isChecked ? "3" : "")]
        }
        
        return array
        
    }
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if ( segue.identifier == "goFinishSubscriptionClient"){
            let destViewController : FinishingSubscriptionViewController = segue.destinationViewController as! FinishingSubscriptionViewController
            
            let universArray = checkboxToArray()
            dataClient.universStyle = universArray
            destViewController.dataUser = dataUser
            destViewController.dataClient = dataClient
            
        }else if (segue.identifier == "backTypeForm"){
            let destViewController : TypeFormViewController = segue.destinationViewController as! TypeFormViewController
            destViewController.dataUser = dataUser
            
        }
        
        
    }


    
}
