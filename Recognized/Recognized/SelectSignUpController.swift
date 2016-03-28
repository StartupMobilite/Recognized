//
//  SelectSignUpController.swift
//  Recognized
//
//  Created by Karine Ould on 23/03/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class SelectSignUpController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) ->
        Int {
        // Return the number of rows in the section.
        return restaurantNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier,
        forIndexPath: indexPath)
        // Configure the cell...
        cell.textLabel?.text = restaurantNames[indexPath.row]
        return cell }

}
