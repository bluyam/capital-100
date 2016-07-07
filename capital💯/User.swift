//
//  User.swift
//  capital💯
//
//  Created by Wilson,Kyle on 7/6/16.
//  Copyright © 2016 Wilson,Kyle. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class User: NSObject {
    var firstname: String
    var lastname: String
    lazy var profileImage: UIImage = {
        // For more complex open graph stories, use `FBSDKShareAPI`
        // with `FBSDKShareOpenGraphContent`
        /* make the API call */
        var request: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "/\(FBSDKProfile.currentProfile().userID)/picture", parameters: nil, HTTPMethod: "GET")
        request.startWithCompletionHandler({ (connection: FBSDKGraphRequestConnection!, result: AnyObject!, error: NSError!) in
            print(result)
        })

        return UIImage()
    }()
    
    init(dict: NSDictionary) {
        firstname = dict["firstname"] as! String
        lastname = dict["lastname"] as! String
    }

}
