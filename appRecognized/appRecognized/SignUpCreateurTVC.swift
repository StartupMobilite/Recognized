//
//  SignUpCreateurTVC.swift
//  appRecognized
//
//  Created by Karine Ould on 02/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData

class SignUpCreateurTVC: UITableViewController, NSFetchedResultsControllerDelegate, UINavigationControllerDelegate {

    var personnes : Users? = nil
    
    @IBOutlet weak var nom: UITextField!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirmPassword: UITextField!
    
    @IBOutlet weak var nomMarque: UITextField!
    
    @IBOutlet weak var logoMarque: UIImageView!
    
    
     let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK - Action Button
    @IBAction func saveSignUp(sender: AnyObject) {
        
//        createNewPersonne()
        
        dismissVC()
    }
    
    @IBAction func cancelSignUp(sender: AnyObject) {
        dismissVC()
    }
    
    func dismissVC() {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    func createNewPersonne(){
        
        let entityDescritpion = NSEntityDescription.entityForName("Users", inManagedObjectContext: moc)
//        
        let personne = Users(entity: entityDescritpion!, insertIntoManagedObjectContext: moc)
//
//        personne.nom = personneNom.text
//        personne.prenom = personnePrenom.text
//        personne.email = personneEmail.text
//        personne.password = personnePassword.text
//        
//        
//        do{
//            try moc.save()
//            
//        }catch{
//            return
//        }
    }

    func createNewMarque(){
    
    
    
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    // --------> CHANGE COLOR HEADER SECTION
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        
//        
//        let label : UILabel = UILabel()
//        if(section == 0){
//            label.text = "Information utilisateur"
//            label.textColor = UIColor.whiteColor()
//        } else if (section == 1){
//            label.text = "Information marque"
//            label.textColor = UIColor.whiteColor()
//        
//        }
//        return label
//    }
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
