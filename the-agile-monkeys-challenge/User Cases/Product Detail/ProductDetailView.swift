//
//  ProductDetailView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class ProductDetailView: BaseViewController, ProductDetailViewContract {
    
    var presenter: ProductDetailPresenter?
    
    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addToWishListButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    // MARK: - Vars
    private var product: Product? {
        self.presenter?.getProduct()
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.checkIsAddedInWishList()
    }
    
    private func setupView() {
        self.navigationItem.largeTitleDisplayMode = .never
        
        self.pageControl.numberOfPages = self.product?.images?.count ?? 0
        self.pageControl.currentPage = 0
        
        self.nameLabel.text = self.product?.name
        self.descriptionLabel.text = self.product?.description
        
        self.priceLabel.text = product?.getPriceWithCurrency()
        
        self.addToWishListButton.setTitle("Add to wishlist", for: .normal)
        self.addToCartButton.setTitle("Add to cart", for: .normal)
        
    }
    
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.isPagingEnabled = true
        
        self.collectionView.register(UINib(nibName: ProductDetailImage.identifier, bundle: nil), forCellWithReuseIdentifier: ProductDetailImage.identifier)
    }
    
    @IBAction func handleAddToWishList(_ sender: UIButton) {
        guard let product = self.product else {
            return
        }
        
        self.presenter?.addToWishList(product: product)
        self.checkIsAddedInWishList()
    }
    
    @IBAction func handleAddToCart(_ sender: UIButton) {
        guard let product = self.product else {
            return
        }
        
        self.presenter?.addToCart(product: product)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let x = targetContentOffset.pointee.x

        self.pageControl.currentPage = Int(x / self.view.frame.width)
    }
    
    private func checkIsAddedInWishList() {
        self.presenter?.isAddedInWishList(product: self.product) { isAdded in
            self.addToWishListButton.isHidden = isAdded
        }
    }

}

// MARK: UICollectionViewDataSource
extension ProductDetailView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.product?.images?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailImage.identifier, for: indexPath)
        
        if let productCell = cell as? ProductDetailImage {
            productCell.configure(data: self.product?.images?[indexPath.row])
        }
    
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProductDetailView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
