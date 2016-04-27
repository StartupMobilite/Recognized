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
    
    @IBOutlet weak var userMenuCell: UITableViewCell!
    
    @IBOutlet weak var imgMenu: UIImageView!
    
    @IBOutlet weak var marqueNameMenu: UILabel!
    
    @IBOutlet weak var nameMenu: UILabel!
    
    //MARK - override views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userMenuCell.backgroundColor = UIColor(patternImage: UIImage(named: "userBackMenu")!)
        imgMenu.layer.cornerRadius = 45.0
        imgMenu.clipsToBounds = true
        
        self.user = session.dictionaryForKey("user")!
        self.createur = session.dictionaryForKey("createur")!
        
//        imgMenu.
        nameMenu.text = (self.user["prenom"] as! String) + " " + (self.user["nom"]!.uppercaseString as String)
        nameMenu.textColor = UIColor.whiteColor()
        
        if self.user["status"] as! String == "createur" {
            marqueNameMenu.text = (self.createur["nomMarque"] as! String)
            marqueNameMenu.textColor = UIColor.whiteColor()

        }

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func logout(sender: AnyObject) {
        
        session.removeObjectForKey("user")
        session.removeObjectForKey("createur")
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
//        let viewStart = self.storyboard?.instantiateViewControllerWithIdentifier("startApp") as? UIViewController!
//        
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        appDelegate.window?.rootViewController = viewStart
        
        
    }
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (section == 0){
            return 5
            
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
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0{
            if indexPath.row == 0 {
                return 127.0
            }
            if indexPath.row == 1 && self.user["status"] as! String == "createur" {
                return 0.0
            }
            if indexPath.row == 2 && self.user["status"] as! String == "createur"{
                return 0.0
            }
        }
        return 44.0
    }
    
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//
//        print(indexPath.section)
//        print(indexPath.row)
//        var cell : UITableViewCell?
//        var cellIdentifier = "comments"
//        
//        
//        if (indexPath.section == 0){
//            
//            if (indexPath.row == 0){
//                cellIdentifier = "monProfil"
//            }else if (indexPath.row == 1){
//                cellIdentifier = "favoris"
//            }else if (indexPath.row == 2){
//                cellIdentifier = "comments"
//            }
//        }
//        
//        cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as UITableViewCell!
//        if cell == nil {
//            cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellIdentifier)
//        }
//        
//        
//        
//        return cell!
//    }
    
}
