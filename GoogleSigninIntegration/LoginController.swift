//
//  ViewController.swift
//  GoogleSigninIntegration
//
//  Created by AJK on 9/27/16.
//  Copyright © 2016 ajk. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    var googleLogin = GoogleLogin()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        googleLogin.startViewController(self)
    }
    
    
    @IBAction func googleLoginTap(sender: AnyObject) {
        
        googleLogin.logIn()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destVC: ProfileController = segue.destinationViewController as? ProfileController {
            
            destVC.google = googleLogin
        }
    }
}

