//
//  WishListBuilder.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 09/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class WishListBuilder {
    
    static func build() -> WishListView {
        let view = WishListView(nibName: String(describing: WishListView.self), bundle: nil)
        let interactor = WishListInteractor()
        let presenter = WishListPresenter()
        let entity = WishListEntity()
        let wireframe = WishListWireframe()
        
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
