//
//  FakeSplashView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 03/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class FakeSplashView: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var splashIcon: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    private let storeProvider = StoreNetworkProvider()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    // MARK: - Helpers
    private func setupView() {
        self.stackView.layer.opacity = 0
        self.animateSplashIcon()
    }
    
    private func animateSplashIcon() {
        let originalTransform = self.splashIcon.transform
        let translateY = originalTransform.translatedBy(x: 0, y: -50)
        
        UIView.animate(withDuration: 0.7, delay: 0.3, options: .curveEaseOut, animations: {
            self.splashIcon.transform = translateY
            self.stackView.transform = translateY
        }, completion: { _ in
            self.stackView.fadeIn { _ in
                self.retrieveStores()
            }
        })
    }
    
    private func retrieveStores() {
        self.storeProvider.retrieveStores { result in
            switch result {
            case .success(_):
                UIViewController.setRootView(MainTabBarView())
            case .failure(_):
                break
            }
        }
    }

}
