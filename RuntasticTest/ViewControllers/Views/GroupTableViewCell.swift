//
//  GroupTableViewCell.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 16/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {

    @IBOutlet weak private var groupNameLabel: UILabel!
    @IBOutlet weak private var membersCountLabel: UILabel!
    @IBOutlet weak private var groupImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var group: Group! {
        didSet {
            groupNameLabel.text = group.groupName
            membersCountLabel.text = "Members: \(group.members!.count)"
            groupImageView.downloaded(from: "\(Constants.groupImageBaseUrl)\(group.groupID).png")
        }
    }



}
