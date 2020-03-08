//
//  UIViewController.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 06/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func appDelegate() -> AppDelegate? {
        return UIApplication.shared.delegate as? AppDelegate
    }
    
    static func setRootView(_ vc: UIViewController) {
        UIApplication.shared.windows.first?.rootViewController = vc
    }
    
}
