//
//  ConfigurableCell.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 06/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import Foundation

protocol ConfigurableCell {
    static var identifier: String { get set }
    associatedtype DataType
    func configure(data: DataType)
}
