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

final class CityButton: Button {

    // MARK: Init

    override func initSubviews() {
        titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        setTitleColor(.white, for: .normal)
        setImage(Asset.icDown.image.withRenderingMode(.alwaysTemplate),
                 for: .normal)
        semanticContentAttribute = .forceRightToLeft
    }
}
