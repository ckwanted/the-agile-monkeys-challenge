//
//  Currency.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

enum Currency: String {
    case eur = "EUR"
    
    var symbol: String {
        switch self {
        case .eur:
            return "€"
        }
    }
    
}
