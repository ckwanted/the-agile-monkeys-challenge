//
//  ProductView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 07/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class ProductView: BaseViewController, ProductViewContract {
    
    var presenter: ProductPresenter?
    
    // MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Vars
    private let interWidth: CGFloat = 2.5
    private let lineSpacing: CGFloat = 16
    private let marginHorizontal: CGFloat = 16
    private var dataSource: [Product] {
        return self.presenter?.getProducts() ?? []
    }

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupCollectionView()
        self.presenter?.retrieveAllProducts(storeId: 1)
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Products"
    }
    
    private func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.contentInset = UIEdgeInsets(top: 20, left: marginHorizontal, bottom: 0, right: marginHorizontal)
        self.collectionView.register(UINib(nibName: ProductCell.identifier, bundle: nil), forCellWithReuseIdentifier: ProductCell.identifier)
    }
    
    // MARK: - Contract
    
    func reloadData() {
        self.collectionView.reloadData()
    }

}

// MARK: UICollectionViewDataSource
extension ProductView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCell.identifier, for: indexPath)
        
        if let productCell = cell as? ProductCell {
            productCell.configure(data: self.dataSource[indexPath.row])
        }
    
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProductView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let padding: CGFloat = 2 * self.marginHorizontal
        let collectionViewSize = (collectionView.frame.size.width / 2) - padding + (self.interWidth * 2)

        return .init(width: collectionViewSize, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.lineSpacing
    }
    
}
