//
//  Category.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct Category: Codable {
    let categoryId: String?
    let name: String?
    let children: [Category]?
    
    private enum CodingKeys: String, CodingKey {
        case categoryId
        case name
        case children
    }
}
