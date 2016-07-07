//
//  HelpFoundViewController.swift
//  capital💯
//
//  Created by Wilson,Kyle on 7/7/16.
//  Copyright © 2016 Wilson,Kyle. All rights reserved.
//

import UIKit

class HelpFoundViewController: UIViewController {
    
    var image: UIImage?
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        imageView.image = image
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageView.frame.width/2
    }
    
    @IBAction func dismissButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func acceptButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
