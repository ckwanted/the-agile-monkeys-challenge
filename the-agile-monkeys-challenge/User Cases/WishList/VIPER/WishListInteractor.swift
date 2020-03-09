//
//  WishListInteractor.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 09/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class WishListInteractor: BaseInteractor, WishListInteractorContract {
    
    var presenter: WishListPresenter?
    
    // MARK: - Contract
    func getWishList() -> [Product] {
        
        let products = DiskHelper.shared.retrieveFromDisk(key: .wishList, objectType: WishListProduct.self) ?? [:]
        
        return Array(products.values)
        
    }
    
    func handleTrash(product: Product, completion: @escaping () -> Void) {
        
        guard let id = product.modelId else {
            completion()
            return
        }
        
        var products = DiskHelper.shared.retrieveFromDisk(key: .wishList, objectType: WishListProduct.self) ?? [:]
        
        products.removeValue(forKey: id)
        DiskHelper.shared.storeInDisk(key: .wishList, object: products)
        completion()
        
    }
    
}
