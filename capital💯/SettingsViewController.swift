//
//  SettingsViewController.swift
//  capital💯
//
//  Created by Wilson,Kyle on 7/6/16.
//  Copyright © 2016 Wilson,Kyle. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class SettingsViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let logoutButton = FBSDKLoginButton()
        logoutButton.clipsToBounds = true
        logoutButton.layer.cornerRadius = 6
        logoutButton.center = view.center
        logoutButton.readPermissions = ["public_profile"]
        view.addSubview(logoutButton)
        logoutButton.delegate = self
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.frame.width/2
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

extension SettingsViewController: FBSDKLoginButtonDelegate {
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        NSNotificationCenter.defaultCenter().postNotificationName("userDidLogoutNotification", object: nil)
    }
    
}
