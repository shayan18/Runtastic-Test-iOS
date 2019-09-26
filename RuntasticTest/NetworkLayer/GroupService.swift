//
//  GroupService.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation
import Moya
enum GroupService {
    
    case getGroups
}

extension GroupService: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .getGroups:
            return "mobile_and_web_2016/groups.json"
       
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getGroups:
            return .get
    
        }
    }
    
    var task: Task {
        switch self {
        case .getGroups:
            return .requestPlain
            
        }
    }
    
    var headers: [String: String]? {
        
        return [:]
    }
    
    var sampleData: Data {
        return Data()
    }
}
