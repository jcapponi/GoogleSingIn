//
//  LoggedViewController.swift
//  GoogleSingIn
//
//  Created by Mauro on 9/23/15.
//  Copyright © 2015 mc. All rights reserved.
//

import UIKit

class LoggedViewController: UIViewController, GIDSignInUIDelegate {

    var userLogged:String!
    
    
    @IBOutlet weak var userLoggerLabel: UILabel!
    
    @IBAction func logOutAction(sender: AnyObject) {
    
        GIDSignIn.sharedInstance().signOut()
        let signInViewController =  self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        
        let sigInViewControllerNav = UINavigationController(rootViewController: signInViewController)
        
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = sigInViewControllerNav

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        GIDSignIn.sharedInstance().uiDelegate = self
        userLoggerLabel.text = userLogged
    
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
