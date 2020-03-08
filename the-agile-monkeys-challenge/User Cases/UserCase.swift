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
    case productDetail(product: Product)
    case wishList
    case cart
    
    var viewController: UIViewController {
        switch self {
        case .fakeSplash:
            return FakeSplashView()
        case .product:
            let productView = ProductBuilder.build()
            return UINavigationController(rootViewController: productView)
        case .productDetail(let product):
            return ProductDetailBuilder.build(product: product)
        case .wishList:
            let wishListView = WishListView()
            return UINavigationController(rootViewController: wishListView)
        case .cart:
            let cartView = CartView()
            return UINavigationController(rootViewController: cartView)
        }
    }
    
}
