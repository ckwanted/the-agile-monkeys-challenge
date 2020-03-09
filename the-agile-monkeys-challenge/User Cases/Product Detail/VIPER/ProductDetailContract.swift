//
//  ProductDetailContract.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

protocol ProductDetailViewContract {
    var presenter: ProductDetailPresenter? { get set }
}

protocol ProductDetailInteractorContract {
    var presenter: ProductDetailPresenter? { get set }
    
    func addToWishList(product: Product)
    func isAddedInWishList(product: Product) -> Bool
    func addToCart(product: Product)
}

protocol ProductDetailPresenterContract {
    var view: ProductDetailView? { get set }
    var interactor: ProductDetailInteractor? { get set }
    var entity: ProductDetailEntity? { get set }
    var wireframe: ProductDetailWireframe? { get set }
    
    func setProduct(_ product: Product?)
    func getProduct() -> Product?
    func addToWishList(product: Product)
    func isAddedInWishList(product: Product?, completion: @escaping (Bool) -> Void)
    func addToCart(product: Product)
}

protocol ProductDetailWireframeContract {
    var presenter: ProductDetailPresenter? { get set }
    var view: ProductDetailView? { get set }
    
    func showAlert(message: String)
}
