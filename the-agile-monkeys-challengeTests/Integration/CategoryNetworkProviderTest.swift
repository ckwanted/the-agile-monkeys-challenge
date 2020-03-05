//
//  CategoryNetworkProviderTest.swift
//  the-agile-monkeys-challengeTests
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import XCTest
@testable import Agile_Monkeys

class CategoryNetworkProviderTest: XCTestCase {
    
    private let categoryProvider = CategoryNetworkProvider()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testFetchAll() {
        let expectation = XCTestExpectation(description: "CategoryProvider should return all categories")
        
        self.categoryProvider.allCategories(storeId: 1) { result in
            switch result {
            case .success(let categories):
                XCTAssert(categories.count > 0)
                expectation.fulfill()
            case .failure( _):
                XCTAssert(false)
            }
        }
        
        wait(for: [expectation], timeout: 4.0)
    }

}
