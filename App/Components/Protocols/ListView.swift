//
//  ListView.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Future

protocol ListView {
    associatedtype Presenter = ListPresenter
    associatedtype DataSource = ProductItemPresenter
    var dataSource: GenericDataSource<DataSource> { get }
    var tableView: TableView { get }

    func initContent()
    func moduleDidLoad(_ forceRefresh: Bool)
    func reload(_ list: [DataSource])
    func setItems(_ items: [DataSource])
}

extension ListView where Self: UIView {

    func observeOutput(_ output: ProductOutput) {
        output.list.observe { [weak self] result in
            guard let self = self else { return }
            self.reload(self.handleResult(result))
        }
        output.reloadItems.observe { [weak self] result in
            guard let self = self else { return }
            self.setItems(self.handleResult(result))
        }
    }

    private func handleResult(_ result: ResultProductsPresenter) -> [DataSource] {
        guard let products = try? result.get() as? [Self.DataSource] else { return [] }
        return products
    }

    func initContent() {
         addSubview(tableView)
         tableView.configureRefresh()
         dataSource.start()
         tableView.onRefresh = { [weak self] in
             guard let self = self else { return }
             self.reload()
         }
     }

    func reload() {
        moduleDidLoad(true)
    }

    func setItems(_ items: [DataSource]) {
        dataSource.setItems(items)
    }

    func reload(_ items: [DataSource]) {
        dataSource.reload(items)
        tableView.endRefreshing()
    }
}
