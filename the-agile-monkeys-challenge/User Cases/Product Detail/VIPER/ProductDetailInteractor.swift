//
//  ProductDetailInteractor.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class ProductDetailInteractor: BaseInteractor, ProductDetailInteractorContract {
    
    var presenter: ProductDetailPresenter?
    
    // MARK: - Contract
    
    func addToWishList(product: Product) {
        
        guard let id = product.modelId else {
            return
        }
        
        var products: WishListProduct = DiskHelper.shared.retrieveFromDisk(key: .wishList, objectType: WishListProduct.self) ?? [:]
        
        products[id] = product
        
        DiskHelper.shared.storeInDisk(key: .wishList, object: products)
        
    }
    
    func isAddedInWishList(product: Product) -> Bool {
        
        guard let id = product.modelId else {
            return false
        }
        
        let products: WishListProduct = DiskHelper.shared.retrieveFromDisk(key: .wishList, objectType: WishListProduct.self) ?? [:]
        
        return products[id] != nil
        
    }
    
    func addToCart(product: Product) {
        
    }
    
}
