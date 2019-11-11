//
//  InCityView.swift
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

final class InCityView: GenericView, Bindable {

    // MARK: Var

    typealias Presenter = InCityPresenter
    var presenter: InCityPresenter?
    lazy var tableView = TableView(.white)
    lazy var dataSource: GenericDataSource<Deal> = {
        return GenericDataSource<Deal>(tableView)
    }()

    // MARK: Init

    override func initSubviews() {
        addSubview(tableView)
        dataSource.start()
        configure()
    }

    func configure() {
        let observer = Promise<[Deal]>()
        presenter?.transform(InCityPresenter.Input(observer: observer))
        observer.observe { [weak self] result in
            guard let self = self,
                let deals = try? result.get()
                else { return }
            self.dataSource.reload(deals)
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
