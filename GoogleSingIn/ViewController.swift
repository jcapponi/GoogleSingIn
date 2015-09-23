//
//  ViewController.swift
//  GoogleSingIn
//
//  Created by Mauro on 9/22/15.
//  Copyright © 2015 mc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GIDSignInUIDelegate {

    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    
    // [START viewdidload]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        GIDSignIn.sharedInstance().uiDelegate = self
    
    }
    
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
        presentViewController viewController: UIViewController!) {
            self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
        dismissViewController viewController: UIViewController!) {
            self.dismissViewControllerAnimated(true, completion: nil)
    }
 
}