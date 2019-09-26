//
//  MemberTableViewCell.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 16/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell {

    @IBOutlet weak private var memberImageView: UIImageView!
    @IBOutlet weak private var avgPaceLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
   
    var member: Member! {
        didSet {
            nameLabel.text = "\(member.memberFirstName ?? "") \(member.memberLastName ?? "")"
            
            avgPaceLabel.text = "\((member.memberActiveMinutes!/Double(member.memberDistanceCovered!))) min/km"
            
            memberImageView.downloaded(from: "\(Constants.memberImageBaseUrl)\(member.memberID).png")
        }
        }

}
