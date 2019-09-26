//
//  RuntasticTestTests.swift
//  RuntasticTestTests
//
//  Created by Shayan Ali on 15/09/2019.
//  Copyright © 2019 Shayan Ali. All rights reserved.
//

import XCTest
@testable import RuntasticTest

class RuntasticTestTests: XCTestCase {
    var promise = XCTestExpectation()
    var groupViewModel = GroupViewModel()

    override func setUp() {
        APItest()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
    }
    
    func APItest() {
        promise = expectation(description: "error")
        groupViewModel.getGroups { [weak self] (result) in
            switch result {
            case.success(let groupResponse):
                if groupResponse.groups!.count > 0 {
                    self?.promise.fulfill()

                }
            case .failure(let error):
                XCTFail("error")

            }
        }
        waitForExpectations(timeout: 5, handler: nil)


    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
