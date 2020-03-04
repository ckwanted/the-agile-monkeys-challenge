//
//  NetworkError.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 04/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case generic(String)
    
    var localizedDescription: String {
        switch self {
        case .generic(let localizableDescription):
            return localizableDescription
        }
    }
}
