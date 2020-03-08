//
//  ProductWireframe.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class ProductWireframe: BaseWireframe, ProductWireframeContract {
    
    var presenter: ProductPresenter?
    var view: ProductView?
    
    // MARK: - Contract
    func navigateToDetail(product: Product) {
        let vc = UserCase.productDetail(product: product).viewController
        self.view?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
