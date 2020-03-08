//
//  ProductContainer.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct ProductContainer: Codable {
    let results: [Product]?
    let filters: [Filter]?
    let resultsCount: Int?
    
    private enum CodingKeys: String, CodingKey {
        case results
        case filters
        case resultsCount
    }
}
