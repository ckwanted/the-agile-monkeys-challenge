//
//  MainTabBarView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class MainTabBarView: UITabBarController {
    
    private lazy var productView = UserCase.product.viewController
    private lazy var wishListView = UserCase.wishList.viewController

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeImage = UIImage(named: "home")
                
        productView.tabBarItem = UITabBarItem(title: "Products", image: homeImage, selectedImage: homeImage)
        wishListView.tabBarItem = UITabBarItem(title: "WishList", image: homeImage, selectedImage: homeImage)
        
        self.setViewControllers([
            productView,
            wishListView
        ], animated: true)
        
        self.selectedIndex = 0
    }

}
