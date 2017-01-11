//
//  ProfileController.swift
//  GoogleSigninIntegration
//
//  Created by AJK on 9/27/16.
//  Copyright © 2016 ajk. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    var google: GoogleLogin!

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblFirstName.text = google.googleFirstName
        lblLastName.text = google.googleLastName
        lblEmail.text = google.googleEmail
    }

    @IBAction func logoutTap(_ sender: AnyObject) {
        
        google.logOut()
        self.dismiss(animated: true) { 
            
            SwiftLoading().hideLoading()
        }
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
