//
//  WishListView.swift
//  the-agile-monkeys-challenge
//
//  Created by Mario Peñate Fariñas on 08/03/2020.
//  Copyright © 2020 Mario Peñate Fariñas. All rights reserved.
//

import UIKit

class WishListView: BaseViewController, WishListViewContract {
    
    var presenter: WishListPresenter?
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Vars
    private var dataSource: [Product] = []

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.reloadData()
    }
    
    private func setupView() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "WishList"
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.allowsMultipleSelection = false
        self.tableView.separatorStyle = .none
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = 80

        self.tableView.register(UINib.init(nibName: String(describing: WishListCell.self), bundle: nil), forCellReuseIdentifier: WishListCell.identifier)
    }
    
    func reloadData() {
        self.dataSource = self.presenter?.getWishList() ?? []
        self.tableView.reloadData()
    }

}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension WishListView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishListCell.identifier, for: indexPath)
        
        cell.selectionStyle = .none
        if let wishListCell = cell as? WishListCell {
            wishListCell.configure(data: self.dataSource[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.presenter?.handleTrash(product: self.dataSource[indexPath.row])
        }
    }
    
}
