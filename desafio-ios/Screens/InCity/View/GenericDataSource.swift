//
//  GenericDataSource.swift
//  desafio-ios
//
//  Created by jean.vinge on 10/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility

class GenericDataSource<T: Any>: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: Var

    var items: [T] = []
    let tableView: UITableView

    // MARK: Init

    init(_ tableView: UITableView) {
        self.tableView = tableView
        super.init()
    }

    func start() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func reload(_ items: [T]) {
        self.items = items
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeue(reusable: ProductCell.self, at: indexPath, with: items[indexPath.row])
    }
}
