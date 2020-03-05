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
    case allStores
    case allCategories(storeId: Int)
    case allCategoriesSortBy(storeId: Int, categoryId: String)
    
    var url: String {
        switch self {
        case .allStores:
            return "\(kBaseUrl)/stores"
        case .allCategories(let storeId):
            return "\(kBaseUrl)/stores/\(storeId)/categories"
        case .allCategoriesSortBy(let storeId, let categoryId):
            return "\(kBaseUrl)/stores/\(storeId)/categories/\(categoryId)/sortby"
        }
    }
    
}
