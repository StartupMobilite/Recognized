//
//  ConnexionViewController.swift
//  appRecognized
//
//  Created by Karine Ould on 10/04/2016.
//  Copyright © 2016 Karine Ould. All rights reserved.
//

import UIKit
import CoreData
import Alamofire

class ConnexionViewController: UIViewController, NSFetchedResultsControllerDelegate {

//    // Retreive the managedObjectContext from AppDelegate
//    let moc = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
//    
//    var frc : NSFetchedResultsController = NSFetchedResultsController()
//    
//    func fetchRequest(entityName: String) -> NSFetchRequest {
//        
//        let fetchRequest = NSFetchRequest(entityName: entityName)
//        let sortDescriptor = NSSortDescriptor(key: "nom", ascending: true)
//        fetchRequest.predicate = predicateByEmailAndPassword("k@k.fr", password: "melon93")
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        return fetchRequest
//    }
//    
//    func predicateByEmailAndPassword(email: String!, password: String!) -> NSPredicate{
//        let predicateTest = NSPredicate(format: "email == %@ AND password == %@",email, password)
//        
//        return predicateTest
//    }
//    
//    func getFRC () {//->  NSFetchedResultsController
//        
//        do {
//            let personneResult = try moc.executeFetchRequest(fetchRequest("Personnes")) as! [Personnes]
//            
//            print("Result : \(personneResult.count)")
//            
//            personneResult.forEach({ (name) in
//                print(name.email)
//                print(name.password)
//            })
//            
//        } catch {
//            fatalError("Failed to fetch employees: \(error)")
//        }
//    }
    
    // MARK - IBOutlet
    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var MainView: UIView!
    
    @IBOutlet weak var FormView: UIView!
    
    @IBOutlet weak var connexionButton: UIButton!
    
    let userdata = User()
    
    // MARK - Override View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Initialize background
        MainView.backgroundColor = UIColor(patternImage: UIImage(named: "MainBackground")!)
        FormView.layer.cornerRadius = 8.5
        FormView.clipsToBounds = true
        //Cacher la navBar
        self.navigationController?.navigationBarHidden = true
        
        // Corner Raduis Img
        connexionButton.layer.cornerRadius = 8.8
        connexionButton.clipsToBounds = true
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBarHidden = true
        self.userdata.findByEmailAndPassword("Personnes", email: "k@k.fr", password: "melon93")
//        let personneTest = frc.fetchedObjects?.count
//        print(personneTest)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK - Action
    @IBAction func connexionAction(sender: AnyObject) {
        
        
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
