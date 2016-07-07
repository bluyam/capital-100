//
//  LoginViewController.swift
//  capital💯
//
//  Created by Wilson,Kyle on 7/6/16.
//  Copyright © 2016 Wilson,Kyle. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        loginButton.readPermissions = ["public_profile"]
        view.addSubview(loginButton)
        loginButton.delegate = self
        FBSDKProfile.enableUpdatesOnAccessTokenChange(true)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.onProfileUpdated), name:FBSDKProfileDidChangeNotification, object: nil)
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print(result)
    }
    
    func onProfileUpdated() {
        print(FBSDKProfile.currentProfile().userID)
        if FBSDKAccessToken.currentAccessToken() != nil {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("TabBarController") as UIViewController
        self.presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func loginWithFacebookPressed() {
//        print("here")
//        let login: FBSDKLoginManager = FBSDKLoginManager()
//        login.logInWithReadPermissions(["public_profile"], fromViewController: self) { (result: FBSDKLoginManagerLoginResult!, error: NSError?) in
//            if error != nil {
//                print("Process error")
//            }
//            else if result.isCancelled {
//                print("Cancelled")
//            }
//            else {
//                print("Logged in")
//            }
//        }
//    }
    
    // Once the button is clicked, show the login dialog
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
