//
//  AppDelegate.swift
//  GoogleSingIn
//
//  Created by Mauro on 9/22/15.
//  Copyright © 2015 mc. All rights reserved.
//

//
//  AppDelegate.swift
//  GoogleSingIn
//
//  Created by Mauro on 9/22/15.
//  Copyright © 2015 mc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    func application(application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
            
            // Initialize sign-in
            var configureError: NSError?
            GGLContext.sharedInstance().configureWithError(&configureError)
            assert(configureError == nil, "Error configuring Google services: \(configureError)")
            
            GIDSignIn.sharedInstance().delegate = self
            
            return true
    }
    
    func application(application: UIApplication,
        openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
            return GIDSignIn.sharedInstance().handleURL(url,
                sourceApplication: sourceApplication,
                annotation: annotation)
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
                // Perform any operations on signed in user here.
                _ = user.userID                  // For client-side use only!
                _ = user.authentication.idToken // Safe to send to the server
                let name = user.profile.name
                _ = user.profile.email
                // [START_EXCLUDE]
                NSNotificationCenter.defaultCenter().postNotificationName(
                    "ToggleAuthUINotification",
                    object: nil,
                    userInfo: ["statusText": "Signed in user:\n\(name)"])
       /*
                //After Login navigate to a new ViewController that show the logged user and allows you oMove to the Log out VieController
                let myStoryBoard:UIStoryboard = UIStoryboard(name:"Main", bundle:nil)
                let loggedInViewController = myStoryBoard.instantiateViewControllerWithIdentifier("LoggedViewController") as! LoggedViewController
                loggedInViewController.userLogged = user.profile.email
                let loggedInViewControllerNav = UINavigationController(rootViewController: loggedInViewController)
                
                self.window?.rootViewController = loggedInViewControllerNav
         */       
                // [END_EXCLUDE]
            } else {
                print("\(error.localizedDescription)")
                // [START_EXCLUDE silent]
                NSNotificationCenter.defaultCenter().postNotificationName(
                    "ToggleAuthUINotification", object: nil, userInfo: nil)
                // [END_EXCLUDE]
            }
    }
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
        withError error: NSError!) {
            // Perform any operations when the user disconnects from app here.
            // [START_EXCLUDE]
            NSNotificationCenter.defaultCenter().postNotificationName(
                "ToggleAuthUINotification",
                object: nil,
                userInfo: ["statusText": "User has disconnected."])
            // [END_EXCLUDE]
    }
    
    
    
}

