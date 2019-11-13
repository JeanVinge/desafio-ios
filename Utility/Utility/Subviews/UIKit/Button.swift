//
//  Button.swift
//  Utility
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

open class Button: UIButton, ConfigurableView {

    // MARK: Init

    public init(_ title: String) {
        super.init(frame: .zero)
        changeTitle(title)
        initLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }

    open func initSubviews() {}

    func changeTitle(_ title: String) {
        setTitle("\(title) ", for: .normal)
    }

    open func initConstraints() {}
}
