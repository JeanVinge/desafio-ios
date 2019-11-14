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

    func moduleDidLoad(_ forceRefresh: Bool)
    func reload(_ list: [DataSource])
    func setItems(_ items: [DataSource])
}
