//
//  ConditionGenraleViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 04/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class ConditionGenraleViewController: UIViewController {

    @IBOutlet weak var nextButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Corner Raduis Img
        nextButton.layer.cornerRadius = 7.0
        nextButton.clipsToBounds = true
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
