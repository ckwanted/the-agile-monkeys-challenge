//
//  ProductDetailBuilder.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class ProductDetailBuilder {
    
    static func build(product: Product?) -> ProductDetailView {
        let view = ProductDetailView(nibName: String(describing: ProductDetailView.self), bundle: nil)
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter()
        let entity = ProductDetailEntity()
        let wireframe = ProductDetailWireframe()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.entity = entity
        presenter.wireframe = wireframe
        
        wireframe.view = view
        wireframe.presenter = presenter
        
        presenter.setProduct(product)
        
        return view
    }
    
}
