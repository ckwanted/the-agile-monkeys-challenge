//
//  ProductContract.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

protocol ProductViewContract {
    var presenter: ProductPresenter? { get set }
    
    func reloadData()
}

protocol ProductInteractorContract {
    var presenter: ProductPresenter? { get set }
    var productProvider: ProductNetworkProvider { get set }
    
    func retrieveAllProducts(storeId: Int, completion: @escaping (Result<ProductContainer, Error>) -> Void)
}

protocol ProductPresenterContract {
    var view: ProductView? { get set }
    var interactor: ProductInteractor? { get set }
    var entity: ProductEntity? { get set }
    var wireframe: ProductWireframe? { get set }
    
    func retrieveAllProducts(storeId: Int) -> Void
    func setProductContainer(_ productContainer: ProductContainer?)
    func getProducts() -> [Product]
}

protocol ProductWireframeContract {
    var presenter: ProductPresenter? { get set }
    var view: ProductView? { get set }
}
