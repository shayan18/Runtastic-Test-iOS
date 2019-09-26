//
//  RequestManager.swift
//  RuntasticTest
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//
import Foundation
import Alamofire
import Moya

class RequestManager {
    // custom session manager
    static func manager() -> Alamofire.SessionManager {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 15 // timeout
        let manager = Alamofire.SessionManager(configuration: configuration)
        manager.adapter = CustomRequestAdapter()
        return manager
    }
    // request adpater to add default http header parameter
    private class CustomRequestAdapter: RequestAdapter {
        public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
            var urlRequest = urlRequest
            urlRequest.setValue("XMLHttpRequest", forHTTPHeaderField: "X-Requested-With")
            return urlRequest
        }
    }
}
