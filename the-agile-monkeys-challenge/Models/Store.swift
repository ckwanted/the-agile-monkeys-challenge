//
//  Store.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct Store: Codable {
    let name: String?
    let countryCode: String?
    let storeCode: String?
    let websiteCode: String?
    let storeViews: [StoreView]?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case countryCode
        case storeCode
        case websiteCode
        case storeViews
    }
}
