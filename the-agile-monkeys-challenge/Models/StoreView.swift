//
//  StoreView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct StoreView: Codable {
    let name: String?
    let storeId: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case storeId
    }
}
