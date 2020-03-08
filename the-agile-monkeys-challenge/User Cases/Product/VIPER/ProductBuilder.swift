//
//  ProductBuilder.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class ProductBuilder {
    
    static func build() -> ProductView {
        let view = ProductView(nibName: String(describing: ProductView.self), bundle: nil)
        let interactor = ProductInteractor()
        let presenter = ProductPresenter()
        let entity = ProductEntity()
        let wireframe = ProductWireframe()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.entity = entity
        presenter.wireframe = wireframe
        
        wireframe.view = view
        wireframe.presenter = presenter
        
        return view
    }
    
}

