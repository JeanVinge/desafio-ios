//
//  BottomView.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Domain

final class BottomView: GenericView {

    // MARK: Var

    lazy var priceView = PriceView()
    lazy var descriptionLabel = UILabel()
        .with
        .numberOfLines(2)
        .font(.systemFont(ofSize: 14))
        .textAlignment(.left)
        .build()

    lazy var stackView = UIStackView()
        .with
        .axis(.vertical)
        .alignment(.fill)
        .distribution(.fill)
        .build()

    lazy var nestedStackView = UIStackView()
        .with
        .axis(.horizontal)
        .alignment(.center)
        .distribution(.fill)
        .build()

    lazy var containerView = UIView()

    // MARK: Init

    override func initSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(nestedStackView)
        nestedStackView.addArrangedSubview(containerView)
        containerView.addSubviews(descriptionLabel, priceView)
    }

    override func initConstraints() {
        stackView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
        descriptionLabel.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
        priceView.layout {
            $0.top.equalToSuperView()
            $0.right.equalToSuperView()
            $0.left.greaterThanOrEqual(to: descriptionLabel.rightAnchor,
                                       offsetBy: 21)
            $0.bottom.equalToSuperView()
        }
    }
}

extension BottomView: ContentConvertible {

    typealias Content = Deal

    func clear() {
        descriptionLabel.text = ""
        priceView.clear()
    }

    func setup(with data: Deal) {
        clear()
        descriptionLabel.text = data.description
        priceView.setup(with: data)
    }
}
