//
//  Group.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
// MARK: - Group
class Group: Codable {
    let groupID: Int
    let groupName: String?
    var members: [Member]?
    
    enum CodingKeys: String, CodingKey {
        case groupID = "group_id"
        case groupName = "group_name"
        case members
    }
}
