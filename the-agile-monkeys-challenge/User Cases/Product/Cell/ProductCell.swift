//
//  ProductCell.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductCell: UICollectionViewCell, ConfigurableCell {
    
    static var identifier: String = "ProductCell"
    private var product: Product?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.backgroundColor = .init(white: 0.3, alpha: 1)
        self.titleLabel.text = nil
        self.priceLabel.text = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.fill()
    }
    
    func configure(data: Product) {
        self.product = data
        self.fill()
    }
    
    private func fill() {
        
        guard let product = self.product else {
            return
        }
        
        self.titleLabel.text = product.name
        self.priceLabel.text = product.getPriceWithCurrency()
        
        if let url = product.mainPictureUrl() {
            self.imageView.af_setImage(withURL: url, imageTransition: UIImageView.ImageTransition.crossDissolve(0.1), runImageTransitionIfCached: true)
        }
        
    }

}
