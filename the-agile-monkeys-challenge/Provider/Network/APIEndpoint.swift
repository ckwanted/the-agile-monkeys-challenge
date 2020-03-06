//
//  APIEndpoint.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

let kBaseUrl = ProcessInfo.processInfo.environment["base_url"] ?? ""

enum APIEndpoint {
    case retrieveStores
    case retrieveCategories(storeId: Int)
    case allCategoriesSortBy(storeId: Int, categoryId: String)
    case retrieveProducts(storeId: Int)
    
    var url: String {
        switch self {
        case .retrieveStores:
            return "\(kBaseUrl)/stores"
        case .retrieveCategories(let storeId):
            return "\(kBaseUrl)/stores/\(storeId)/categories"
        case .allCategoriesSortBy(let storeId, let categoryId):
            return "\(kBaseUrl)/stores/\(storeId)/categories/\(categoryId)/sortby"
        case .retrieveProducts(let storeID):
            return "\(kBaseUrl)/stores/\(storeID)/products/search"
        }
    }
    
}
