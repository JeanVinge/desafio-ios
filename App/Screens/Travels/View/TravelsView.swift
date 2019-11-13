//
//  TravelsView.swift
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

final class TravelsView: GenericView, Bindable {

    // MARK: Var

    typealias Presenter = TravelsPresenter

    var presenter: TravelsPresenter?

    lazy var tableView = TableView(.white)

    lazy var dataSource: GenericDataSource<Deal> = {
        return GenericDataSource<Deal>(tableView)
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

    @objc func reload() {
        moduleDidLoad()
    }

    func moduleDidLoad() {
        let promise = Promise<[Deal]>()
        presenter?.transform(TravelsPresenter.Input(observer: promise))
        promise.observe { [weak self] result in
            guard let self = self,
                let deals = try? result.get()
                else { return }
            self.dataSource.reload(deals)
            DispatchQueue.main.async {
                self.tableView.refreshControl?.endRefreshing()
            }
        }
    }

    override func initConstraints() {
        tableView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }
}
