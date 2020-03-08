//
//  ProductPresenter.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class ProductPresenter: BasePresenter, ProductPresenterContract {
    
    var view: ProductView?
    var interactor: ProductInteractor?
    var entity: ProductEntity?
    var wireframe: ProductWireframe?
    
    // MARK: - Contract
    
    func retrieveAllProducts(storeId: Int) -> Void {
        self.wireframe?.showLoading()
        self.interactor?.retrieveAllProducts(storeId: storeId) { result in
            self.wireframe?.dismissLoading()
            switch result {
            case .success(let productContainer):
                self.saveProductContainer(productContainer)
            case .failure(let error):
                self.saveProductContainer(nil)
            }
            self.view?.reloadData()
        }
    }
    
    func saveProductContainer(_ productContainer: ProductContainer?) {
        self.entity?.productContainer = productContainer
    }
    
    func getProducts() -> [Product] {
        return self.entity?.productContainer?.results ?? []
    }
    
}
