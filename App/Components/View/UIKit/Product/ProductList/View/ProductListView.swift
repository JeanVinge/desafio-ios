//
//  ProductListView.swift
//  desafio-ios
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import NetworkLayer
import Domain
import Future

typealias ProductListViewController = ViewController<ProductListView>

final class ProductListView: GenericView, ListView, Bindable {

    // MARK: Var

    typealias Presenter = ProductListPresenter

    var presenter: Presenter?

    lazy var tableView = TableView(.white)

    lazy var dataSource: GenericDataSource<ProductItemPresenter> = {
        return GenericDataSource<ProductItemPresenter>(tableView)
    }()

    // MARK: Init

    override func initSubviews() {
        addSubview(tableView)
        tableView.configureRefresh()
        dataSource.start()
        tableView.onRefresh = { [weak self] in
            guard let self = self else { return }
            self.reload()
        }
    }

    func moduleDidLoad(_ forceRefresh: Bool) {
        guard let presenter = presenter else { return }
        observeOutput(presenter.transform(ProductInput(forceRefresh: forceRefresh)))
    }

    override func initConstraints() {
        tableView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }

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

    private func handleResult(_ result: ResultProductsPresenter) -> [ProductItemPresenter] {
        guard let products = try? result.get() else { return [] }
        return products
    }

    func reload() {
        moduleDidLoad(true)
    }

    func setItems(_ items: [ProductItemPresenter]) {
        dataSource.setItems(items)
    }

    func reload(_ items: [ProductItemPresenter]) {
        dataSource.reload(items)
        tableView.endRefreshing()
    }
}
