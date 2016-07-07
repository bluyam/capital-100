//
//  AssistanceViewController.swift
//  capital💯
//
//  Created by Wilson,Kyle on 7/6/16.
//  Copyright © 2016 Wilson,Kyle. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class AssistanceViewController: UIViewController {

    var greenColor: UIColor?
    var awaitingRequest: Bool = true
    var helperImage: UIImage?
    
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var HeaderLabel: UILabel!
    @IBOutlet var subHeaderLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var requestAssistanceLabel: UILabel!
    @IBOutlet var pastIssuesLabel: UILabel!
    
    @IBAction func reuqestAssistanceButton(sender: AnyObject) {
        print("button pressed")
        if requestAssistanceLabel.text != "Finding An Ambassador" {
            awaitingRequest = true
            createIssue()
        }
        HeaderLabel.text = "Hang Tight Kyle"
        requestAssistanceLabel.backgroundColor = UIColor(red: 1, green: 201/255, blue: 32/255, alpha: 1)
        subHeaderLabel.text = "We should find someone after a few seconds..."
        requestAssistanceLabel.text = "Finding An Ambassador"
        tryGettingJaiden()
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 4 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
                self.tryGettingJaiden()
        }
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if awaitingRequest {
            HeaderLabel.text = "Good Morning Kyle!"
            requestAssistanceLabel.backgroundColor = greenColor
            subHeaderLabel.text = "Welcome to the Capital One Cafe. Have you been helped?"
            requestAssistanceLabel.text = "Speak To An Ambassador"
            awaitingRequest = false
        }
        
        requestAssistanceLabel.clipsToBounds = true
        requestAssistanceLabel.layer.cornerRadius = 24
        pastIssuesLabel.clipsToBounds = true
        pastIssuesLabel.layer.cornerRadius = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        greenColor = requestAssistanceLabel.backgroundColor

        headerImageView.sendSubviewToBack(view)
        tableView.dataSource = self
        tableView.delegate = self
        print()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let helpFoundVC = segue.destinationViewController as! HelpFoundViewController
        if helperImage != nil {
            helpFoundVC.image = helperImage
        }
    }
    
    func createIssue() {
        let url = NSURL(string:"https://radiant-beach-84450.herokuapp.com/api/add_issue")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "POST"
        
        // form post request
        let tempParams = NSMutableDictionary()
        tempParams["token"] = 42
        let help = NSMutableDictionary()
        help["type"] = "Checking"
        help["info"] = "Kyle Wilson's Issue"
        help["customer_id"] = "577e775932d3841100d88049"
        help["ambassador_id"] = "null"
        help["finished"] = "null"
        help["rating"] = "null"
        help["notes"] = "null"
        tempParams["help"] = help
        
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(tempParams, options: .PrettyPrinted)
        print(NSString(data: request.HTTPBody!, encoding: NSUTF8StringEncoding))
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        let task = session.dataTaskWithRequest(request,
           completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                    data, options:[]) as? NSDictionary {
                    print(responseDictionary)
                }
            }
            else {
                print ("A networking error occurred.")
            }
        });
        task.resume()
    }
    
    func tryGettingJaiden() {
        
        let url = NSURL(string:"https://radiant-beach-84450.herokuapp.com/api/get_jaiden")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        let task = session.dataTaskWithRequest(request,
           completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                    data, options:[]) as? NSDictionary {
                    print(responseDictionary)
                    print("\n\n\n\nhaihain\n\n\n")
                    let user = responseDictionary["user"] as! NSDictionary
                    let ppString = user["profilePicture"] as! String
                    let index1 = ppString.startIndex.advancedBy(22)
                    print("MARKAM: \(ppString.substringFromIndex(index1))")
                    let base64String = ppString.substringFromIndex(index1)
                    let dataDecoded:NSData = NSData(base64EncodedString: base64String, options: NSDataBase64DecodingOptions(rawValue: 0))!
                    let decodedimage:UIImage = UIImage(data: dataDecoded)!
                    print(decodedimage)
                    self.helperImage = decodedimage
                    self.performSegueWithIdentifier("helpFoundSegue", sender: nil)
                }
            }
            else {
                print ("A networking error occurred.")
            }
        });
        task.resume()
        
    }

 

}

extension AssistanceViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IssueCell") as! IssueTableViewCell
        // cell.configureCell()
        return cell
    }
}

extension AssistanceViewController: UITableViewDelegate {}

