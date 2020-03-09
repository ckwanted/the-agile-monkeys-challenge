//
//  WishListCell.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 09/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class WishListCell: UITableViewCell, ConfigurableCell {
    
    static var identifier: String = "WishListCell"
    private var product: Product?

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var mainTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainTextLabel.text = nil
    }
    
    func configure(data: Product?) {
        self.product = data
        self.fill()
    }
    
    private func fill() {
        
        guard let product = self.product else {
            return
        }
        
        self.mainTextLabel.text = product.name

        if let url = product.mainPictureUrl() {
            self.thumbnailImage.af_setImage(withURL: url, imageTransition: UIImageView.ImageTransition.crossDissolve(0.1), runImageTransitionIfCached: true)
        }
        
    }
    
}
