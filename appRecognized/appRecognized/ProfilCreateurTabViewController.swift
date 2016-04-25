//
//  ProfilCreateurTabViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 25/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class ProfilCreateurTabViewController: UITableViewController {

    
    
    
    
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0){
            return 4
        }
        
        return 3
    }
}
