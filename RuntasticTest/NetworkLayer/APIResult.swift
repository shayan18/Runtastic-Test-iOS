//
//  APIResult.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case success(T)
    case failure(String)
}
