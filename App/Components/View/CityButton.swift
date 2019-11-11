//
//  CityButton.swift
//  desafio-ios
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Resources

class CityButton: UIButton, ConfigurableView {

    // MARK: Init

    init(_ title: String) {
        super.init(frame: .zero)
        changeTitle(title)
        initLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        initLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initLayout()
    }

    func initSubviews() {
        setTitleColor(.white, for: .normal)
        setImage(Asset.icDown.image.withRenderingMode(.alwaysTemplate), for: .normal)
        semanticContentAttribute = .forceRightToLeft
    }

    func changeTitle(_ title: String) {
        setTitle("\(title) ", for: .normal)
    }

    func initConstraints() {}
}
