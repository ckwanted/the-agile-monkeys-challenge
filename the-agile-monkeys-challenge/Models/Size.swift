//
//  Size.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct Size: Codable {
    let variantId: String?
    let name: String?
    let stockQty: Int?
    
    private enum CodingKeys: String, CodingKey {
        case variantId
        case name
        case stockQty
    }
}
