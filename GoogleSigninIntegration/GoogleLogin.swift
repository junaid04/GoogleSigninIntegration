//
//  GoogleSignIn.swift
//  GoogleSigninIntegration
//
//  Created by AJK on 9/27/16.
//  Copyright © 2016 ajk. All rights reserved.
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
    
    func startViewController(_ callerVC: UIViewController) {
        
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
        viewController.performSegue(withIdentifier: "Login", sender: self)
    }
    
    //MARK : - SignInUI Delegate
    func sign(inWillDispatch signIn: GIDSignIn!, error: Error!) {
        SwiftLoading().hideLoading()
    }
    
    // Present a view that prompts the user to sign in with Google
    func sign(_ signIn: GIDSignIn!,
                present viewController: UIViewController!) {
        self.viewController.present(viewController, animated: true) {
            
            SwiftLoading().hideLoading()
        }
    }
    
    // Dismiss the "Sign in with Google" view
    func sign(_ signIn: GIDSignIn!,
                dismiss viewController: UIViewController!) {
        self.viewController.dismiss(animated: true) {
            SwiftLoading().showLoading()
        }
    }
    
    // MARK: - GIDSignInDelegate
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        SwiftLoading().hideLoading()
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            self.googleEmail = email!
            self.googleFirstName = givenName!
            self.googleLastName = familyName!
            
            print(userId!)
            print(idToken!)
            print(fullName!)
            print(givenName!)
            print(familyName!)
            print(email!)
            
            //self.moveToViewController()
            
        } else {
            print("\(error.localizedDescription)")
        }
    }
}
