//
//  CartView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class CartView: BaseViewController {

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Cart"
    }

}
