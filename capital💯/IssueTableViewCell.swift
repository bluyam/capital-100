//
//  IssueTableViewCell.swift
//  capital💯
//
//  Created by Wilson,Kyle on 7/6/16.
//  Copyright © 2016 Wilson,Kyle. All rights reserved.
//

import UIKit

class IssueTableViewCell: UITableViewCell {

    @IBOutlet var issueTitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var resolverImageView: UIImageView!
    @IBOutlet var resolvedByLabel: UILabel!
    @IBOutlet var issueNotesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
