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
                sleep(1)
                UIViewController.setRootView(MainTabBarView())
            }
        })
    }

}
