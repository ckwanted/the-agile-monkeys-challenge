//
//  Product.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 05/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

struct Product: Codable {
    let modelId: String?
    let name: String?
    let type: String?
    let sku: String?
    let description: String?
    let url: String?
    let color: String?
    let composition: String?
    let care: String?
    let originalPrice: Float?
    let finalPrice: Float?
    let finalPriceType: String?
    let currency: String?
    let images: [String]?
    let sizes: [Size]?
    
    private enum CodingKeys: String, CodingKey {
        case modelId
        case name
        case type
        case sku
        case description
        case url
        case color
        case composition
        case care
        case originalPrice
        case finalPrice
        case finalPriceType
        case currency
        case images
        case sizes
    }
    
    func mainPictureUrl() -> URL? {
        return URL(string: self.images?.first ?? "")
    }
    
    func getPriceWithCurrency() -> String? {
        
        if let price = self.finalPrice, let currencyString = self.currency, let currency = Currency(rawValue: currencyString) {
            return "\(price / 100) \(currency.symbol)"
        }
        
        return nil
    }
    
}
