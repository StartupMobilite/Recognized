//
//  HomeScreenViewController.swift
//  TestBDD
//
//  Created by Ben Nikiema on 02/12/2015.
//  Copyright © 2015 Ben Nikiema. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var tbStudentData: UITableView!
    
    @IBAction func btnDeleteClicked(sender: AnyObject) {}
    
    @IBAction func btnEditClicked(sender: AnyObject) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
