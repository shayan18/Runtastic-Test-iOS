//
//  Providers.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//
import Foundation
import Moya

struct Providers {
    static let groupProvider = MoyaProvider<GroupService>(manager: RequestManager.manager())
}
