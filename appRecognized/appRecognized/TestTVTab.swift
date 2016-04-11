//
//  TestTVTab.swift

//
//  Created by Karine Ould on 28/03/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class TestTVTab: UIViewController{
    
//    @IBOutlet weak var createurImg: UIImageView!
//    
//    @IBOutlet weak var clientImg: UIImageView!
    
    @IBOutlet weak var createurImg: UIButton!
    
    @IBOutlet weak var clientImg: UIButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = false
        
        // Initialize the background
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blue-violet-blurry-background")!)
        let backgroundColor = CIColor(red: 171, green: 130, blue: 255, alpha: 0.5)
        self.view.backgroundColor = UIColor.init(CIColor: backgroundColor)
        
        
        // Corner Raduis Img
        createurImg.layer.cornerRadius = 8.0
        createurImg.clipsToBounds = true

        clientImg.layer.cornerRadius = 8.0
        clientImg.clipsToBounds = true
        

    }
    
    
}
