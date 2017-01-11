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
    
    
    @IBAction func googleLoginTap(_ sender: AnyObject) {
        
        googleLogin.logIn()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destVC: ProfileController = segue.destination as? ProfileController {
            
            destVC.google = googleLogin
        }
    }
}

