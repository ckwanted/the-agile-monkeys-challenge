//
//  BaseWireframe.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

class BaseWireframe {
    
    func showLoading() {
        let activityData = ActivityData()
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func dismissLoading() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
    
}
