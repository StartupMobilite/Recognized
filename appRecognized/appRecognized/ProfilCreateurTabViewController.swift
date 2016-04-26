//
//  ProfilCreateurTabViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 25/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit

class ProfilCreateurTabViewController: UITableViewController {
    
    var user  =  NSDictionary()
    var createur  =  NSDictionary()
    
    //MARK - override views
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
        self.user = session.dictionaryForKey("user")!
        self.createur = session.dictionaryForKey("createur")!
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        print(secti)
//        for nbCell in sectionCell{
//            if ( section = )
//        }
        
        if (section == 0){
            return 3
            
        }else if (section == 1){
            if self.user["status"] as! String == "createur" {
                return 1
            }else{
                return 0
            }
        }else if (section == 2){
            return 2
        }else if (section == 3){
            return 1
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        print(indexPath.section)
        print(indexPath.row)
        var cell : UITableViewCell?
        var cellIdentifier = "comments"
        
        
        if (indexPath.section == 0){
            
            if (indexPath.row == 0){
                cellIdentifier = "monProfil"
            }else if (indexPath.row == 1){
                cellIdentifier = "favoris"
            }else if (indexPath.row == 2){
                cellIdentifier = "comments"
            }
        }
        
        cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
        if cell == nil {
            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        
        
        return cell!
    }
    
}
