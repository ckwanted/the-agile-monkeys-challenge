//
//  ProductDeailPresenter.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class ProductDetailPresenter: BasePresenter, ProductDetailPresenterContract {
    
    var view: ProductDetailView?
    var interactor: ProductDetailInteractor?
    var entity: ProductDetailEntity?
    var wireframe: ProductDetailWireframe?
    
    // MARK: - Contract
    
    func setProduct(_ product: Product?) {
        self.entity?.product = product
    }
    
    func getProduct() -> Product? {
        return self.entity?.product
    }
    
}
