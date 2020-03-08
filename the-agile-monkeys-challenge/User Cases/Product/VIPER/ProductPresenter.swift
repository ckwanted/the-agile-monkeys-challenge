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
                self.setProductContainer(productContainer)
            case .failure(_):
                self.setProductContainer(nil)
            }
            self.view?.reloadData()
        }
    }
    
    func setProductContainer(_ productContainer: ProductContainer?) {
        self.entity?.productContainer = productContainer
    }
    
    func getProducts() -> [Product] {
        return self.entity?.productContainer?.results ?? []
    }
    
    func navigateToDetail(product: Product) {
        self.wireframe?.navigateToDetail(product: product)
    }
    
}
