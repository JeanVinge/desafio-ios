//
//  GenericView.swift
//  Utility
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

open class GenericView: UIView, ConfigurableView {

    // MARK: Init

    init() {
        super.init(frame: .zero)
        initLayout()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }

    open func initSubviews() {}
    open func initConstraints() {}
}
