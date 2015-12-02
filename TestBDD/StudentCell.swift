//
//  StudentCell.swift
//  TestBDD
//
//  Created by Ben Nikiema on 02/12/2015.
//  Copyright © 2015 Ben Nikiema. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    @IBOutlet weak var lblContent: UILabel! // for displaying student name and scoold
    
    @IBOutlet weak var btnEdit: UIButton!
    
    @IBOutlet weak var btnDelete: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
