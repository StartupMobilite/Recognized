//
//  StartAppViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 03/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class StartAppViewController: UIViewController {

    @IBOutlet weak var inscriptionButton: UIButton!
    
    @IBOutlet weak var connexionButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        UIGraphicsBeginImageContext(self.view.frame.size);
//        [[UIImage imageNamed:"MainBackground"], drawInRect:self.view.bounds];
//        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
//        
//        self.view.backgroundColor = [UIColor colorWithPatternImage:image];
        
        
        //Initialize background 
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "MainBackground")!)

        //Cacher la navBar
        self.navigationController?.navigationBarHidden = true
        
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
