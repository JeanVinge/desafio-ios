//
//  TableView.swift
//  Utility
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public class TableView: UITableView {

    // MARK: Var

    public var onRefresh: EmptyCompletion?

    // MARK: Init

    public func configureRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(didLoad), for: .valueChanged)
    }

    @objc private func didLoad() {
        onRefresh?()
    }
}
