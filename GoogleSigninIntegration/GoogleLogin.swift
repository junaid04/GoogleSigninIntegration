//
//  GoogleSignIn.swift
//  HitchzCustomer
//
//  Created by AJK on 6/30/16.
//  Copyright © 2016 AJKTechnologies. All rights reserved.
//

import Foundation
import GoogleSignIn

class GoogleLogin: NSObject, GIDSignInUIDelegate,GIDSignInDelegate {
    
    var viewController:UIViewController!
    var googleEmail = ""
    var googleFirstName = ""
    var googleLastName = ""
    
    
    override init() {
        super.init()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
    }
    
    
    func startViewController(callerVC: UIViewController) {
        
        self.viewController = callerVC
    
    }
    
    func logIn() {
        
        GIDSignIn.sharedInstance().signIn()

    }
    
    func logOut() {
        
        SwiftLoading().showLoading()
        GIDSignIn.sharedInstance().signOut()
        print("GOOGLe LogOUt")
    }
    
    
    func moveToViewController() {
        
        SwiftLoading().hideLoading()
        viewController.performSegueWithIdentifier("Login", sender: self)
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            self.googleEmail = email
            self.googleFirstName = givenName
            self.googleLastName = familyName
            
            print(userId)
            print(idToken)
            print(fullName)
            print(givenName)
            print(familyName)
            print(email)

            self.moveToViewController()
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
    
    
    //MARK : - SignInUI Delegate
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        //myActivityIndicator.stopAnimating()
        SwiftLoading().hideLoading()
        
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.viewController.presentViewController(viewController, animated: true) {
            
            SwiftLoading().hideLoading()
        }
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.viewController.dismissViewControllerAnimated(true) {
            
            SwiftLoading().showLoading()
            
        }
    }
    
    
}
