//
//  Member.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
// MARK: - Member
class Member: Codable {
    
    let memberID: Int
    let memberFirstName, memberLastName: String?
    let memberDistanceCovered: Int?
    let memberActiveMinutes: Double?
    var istrainingBuddy = false
    
    enum CodingKeys: String, CodingKey {
        case memberID = "member_id"
        case memberFirstName = "member_first_name"
        case memberLastName = "member_last_name"
        case memberDistanceCovered = "member_distance_covered"
        case memberActiveMinutes = "member_active_minutes"
    }
}
