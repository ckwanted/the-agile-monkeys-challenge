//
//  ProductDetailWireframe.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class ProductDetailWireframe: BaseWireframe, ProductDetailWireframeContract {
    
    var presenter: ProductDetailPresenter?
    var view: ProductDetailView?
    
    // MARK: - Contract
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: "Coming soon", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(actionOk)
        
        self.view?.present(alert, animated: true)
    }
    
}
