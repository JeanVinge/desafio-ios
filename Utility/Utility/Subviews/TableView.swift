//
//  TableView.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

open class TableView: UITableView, ConfigurableView {

    // MARK: Init

    public init(_ backgroundColor: UIColor = .clear) {
        super.init(frame: .zero, style: .plain)
        self.backgroundColor = backgroundColor
        self.separatorStyle = .none
        self.separatorInset = .zero
        self.separatorColor = .clear

        self.estimatedRowHeight = 1
        self.contentInset = .zero
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initLayout()
    }

    open func initSubviews() {
    }

    open func initConstraints() {

    }
}
