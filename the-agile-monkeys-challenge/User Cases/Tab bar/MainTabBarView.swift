//
//  MainTabBarView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class MainTabBarView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([
            UserCase.product.viewController
        ], animated: true)
    }

}
