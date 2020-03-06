//
//  StoreNetworkProviderTest.swift
//  the-agile-monkeys-challengeTests
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import XCTest
@testable import Agile_Monkeys

class StoreNetworkProviderTest: XCTestCase {
    
    private let storeProvider = StoreNetworkProvider()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        self.storeProvider.cancelAllRequest()
    }

    func testFetchAllStores() {
        let expectation = XCTestExpectation(description: "StoreProvider should return all stores")
        
        self.storeProvider.retrieveStores { result in
            switch result {
            case .success(let stores):
                XCTAssert(stores.count > 0)
                expectation.fulfill()
            case .failure( _):
                XCTAssert(false)
            }
        }
        
        wait(for: [expectation], timeout: 4.0)
    }

}
