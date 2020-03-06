//
//  Option.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct Option: Codable {
    let id: String?
    let label: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case label
    }
}
