//
//  ProductNetworkProviderTest.swift
//  the-agile-monkeys-challengeTests
//
//  Created by Mario Peñate Fariñas on 06/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import XCTest
@testable import Agile_Monkeys

class ProductNetworkProviderTest: XCTestCase {
    
    private let productProvider = ProductNetworkProvider()

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
        self.productProvider.cancelAllRequest()
    }

    func testFetchAllProducts() {
        let expectation = XCTestExpectation(description: "ProductProvider should return all products")
        
        self.productProvider.retrieveProducts(storeId: 1) { result in
            switch result {
            case .success(let products):
                XCTAssert(products.results?.count ?? 0 > 0)
                XCTAssert(products.filters?.count ?? 0 > 0)
                expectation.fulfill()
            case .failure( _):
                XCTAssert(false)
            }
        }
        
        wait(for: [expectation], timeout: 4.0)
    }

}
