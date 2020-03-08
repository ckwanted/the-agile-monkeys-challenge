//
//  Productlnteractor.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class ProductInteractor: BaseInteractor, ProductInteractorContract {
    
    var presenter: ProductPresenter?
    lazy var productProvider = ProductNetworkProvider()
    
    // MARK: - Contract
    
    func retrieveAllProducts(storeId: Int, completion: @escaping (Result<ProductContainer, Error>) -> Void) {
        
        self.productProvider.retrieveProducts(storeId: storeId) { result in
            completion(result)
        }
        
    }
    
}
