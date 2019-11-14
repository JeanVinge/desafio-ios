//
//  GenericDataSource.swift
//  desafio-ios
//
//  Created by jean.vinge on 10/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Future

final class GenericDataSource<T: Any>: NSObject, UITableViewDataSource, UITableViewDelegate {

    // MARK: Var

    var items: [T] = []
    let tableView: TableView

    // MARK: Init

    init(_ tableView: TableView) {
        self.tableView = tableView
        super.init()
    }

    func start() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    func setItems(_ items: [T]) {
        self.items = items
    }

    func reload(_ items: [T]) {
        setItems(items)
        tableView.dispatchReloadData()
    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    // MARK: UITableViewDelegate

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeue(reusable: ProductCell.self,
                                 at: indexPath,
                                 with: items[indexPath.row])
    }
}
