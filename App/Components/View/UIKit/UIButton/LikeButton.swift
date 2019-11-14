//
//  LikeButton.swift
//  App
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Resources

final class LikeButton: Button {

    // MARK: Init

    override var isSelected: Bool {
        didSet {
            tintColor = isSelected ? .red : .white
        }
    }

    override func initSubviews() {
        setImage(Asset.icHeart.image.withRenderingMode(.alwaysTemplate),
                 for: .normal)
        setImage(Asset.icHeartFilled.image.withRenderingMode(.alwaysTemplate),
                 for: .selected)
        tintColor = .white
        backgroundColor = UIColor.black.withAlphaComponent(0.4)
        layer.masksToBounds = true
        addTarget(self, action: #selector(selection), for: .touchUpInside)
    }

    override func initConstraints() {
        layout {
            $0.height.constraint(equalToConstant: 50)
            $0.width.constraint(equalToConstant: 50)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.width / 2
    }

    // MARK: Action

    @objc func selection() {
        isSelected = !isSelected
    }
}
