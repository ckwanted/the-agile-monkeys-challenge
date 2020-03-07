//
//  UserCase.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 03/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

enum UserCase {
    case fakeSplash
    case product
    
    var viewController: UIViewController {
        switch self {
        case .fakeSplash:
            return FakeSplashView()
        case .product:
            let productView = ProductBuilder.build()
            return UINavigationController(rootViewController: productView)
        }
    }
    
}
