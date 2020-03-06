//
//  Filter.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct Filter: Codable {
    let label: String?
    let filterName: String?
    let type: String?
    let options: [Option]?
    
    private enum CodingKeys: String, CodingKey {
        case label
        case filterName
        case type
        case options
    }
}
