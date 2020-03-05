//
//  Filter.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct Filter: Codable {
    let name: String?
    let order: String?
    let direction: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case order
        case direction
    }
}
