//
//  WishListPresenter.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 09/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

class WishListPresenter: BasePresenter, WishListPresenterContract {
    
    var view: WishListView?
    var interactor: WishListInteractor?
    var entity: WishListEntity?
    var wireframe: WishListWireframe?
    
    // MARK: - Contract
    
    func getWishList() -> [Product] {
        return self.interactor?.getWishList() ?? []
    }
    
    func handleTrash(product: Product) {
        self.interactor?.handleTrash(product: product) {
            self.view?.reloadData()
        }
    }
    
}
