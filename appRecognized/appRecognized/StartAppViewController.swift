//
//  StartAppViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 03/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class StartAppViewController: UIViewController {
    
    
    var test = ""

    @IBOutlet weak var inscriptionButton: UIButton!
    
    @IBOutlet weak var connexionButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize background 
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "MainBackground")!)

        //Cacher la navBar
        self.navigationController?.navigationBarHidden = true
//        self.navigationController?.popToRootViewControllerAnimated(true)
        
        // Corner Raduis Img
        inscriptionButton.layer.cornerRadius = 8.0
        inscriptionButton.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
