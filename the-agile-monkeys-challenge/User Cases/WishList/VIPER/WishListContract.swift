//
//  WishListContract.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 09/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

protocol WishListViewContract {
    var presenter: WishListPresenter? { get set }
    
    func reloadData()
}

protocol WishListInteractorContract {
    var presenter: WishListPresenter? { get set }
    
    func getWishList() -> [Product]
    func handleTrash(product: Product, completion: @escaping () -> Void)
}

protocol WishListPresenterContract {
    var view: WishListView? { get set }
    var interactor: WishListInteractor? { get set }
    var entity: WishListEntity? { get set }
    var wireframe: WishListWireframe? { get set }
    
    func getWishList() -> [Product]
    func handleTrash(product: Product)
}

protocol WishListWireframeContract {
    var presenter: WishListPresenter? { get set }
    var view: WishListView? { get set }
}
