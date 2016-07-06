//
//  AssistanceViewController.swift
//  capital💯
//
//  Created by Wilson,Kyle on 7/6/16.
//  Copyright © 2016 Wilson,Kyle. All rights reserved.
//

import UIKit

class AssistanceViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var requestAssistanceLabel: UILabel!
    @IBOutlet var pastIssuesLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        requestAssistanceLabel.clipsToBounds = true
        requestAssistanceLabel.layer.cornerRadius = 24
        pastIssuesLabel.clipsToBounds = true
        pastIssuesLabel.layer.cornerRadius = 8
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
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

extension AssistanceViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("IssueCell") as! IssueTableViewCell
        // cell.configureCell()
        return cell
    }
}

extension AssistanceViewController: UITableViewDelegate {}