//
//  Checkbox.swift
//  appRecognized
//
//  Created by Karine Ould on 06/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class Checkbox: UIButton {

    //images
    let checkedImage = UIImage(named: "checked_checkbox")
    let unCheckedImage = UIImage(named: "unchecked_checkbox")
    
    //bool propety
    var isChecked:Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(unCheckedImage, forState: .Normal)

            }
        }
    }
    
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(Checkbox.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    
//    func updateImage() {
//        if isChecked == true{
//            self.setImage(checkedImage, forState: .Normal)
//        }else{
//            self.setImage(unCheckedImage, forState: .Normal)
//        }
//        
//    }
    
    func buttonClicked(sender:UIButton) {
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
                
            }
        }
    }
}
