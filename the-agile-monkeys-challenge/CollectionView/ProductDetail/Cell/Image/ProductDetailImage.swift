//
//  ProductDetailImage.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit
import AlamofireImage

class ProductDetailImage: UICollectionViewCell, ConfigurableCell {
    
    static var identifier: String = "ProductDetailImage"
    private var dataUrl: String?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageView.backgroundColor = .init(white: 0.9, alpha: 1)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.fill()
    }
    
    func configure(data: String?) {
        self.dataUrl = data
        self.fill()
    }
    
    private func fill() {
        
        guard let dataUrl = self.dataUrl else {
            return
        }
        
        if let url = URL(string: dataUrl) {
            self.imageView.af_setImage(withURL: url, imageTransition: UIImageView.ImageTransition.crossDissolve(0.1), runImageTransitionIfCached: true)
        }
        
    }

}
