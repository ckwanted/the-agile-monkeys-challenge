//
//  UIView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 03/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

extension UIView {
    
    func fadeIn(withDuration: Double = 0.3, completion: @escaping ((Bool) -> Void)) {
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = 1.0
        }, completion: completion)
    }
    
    func fadeOut(withDuration: Double = 0.3, completion: @escaping ((Bool) -> Void)) {
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = 0.0
        }, completion: completion)
    }
    
}
