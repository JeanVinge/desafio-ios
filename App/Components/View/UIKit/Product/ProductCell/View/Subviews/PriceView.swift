//
//  PriceView.swift
//  App
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Domain
import Resources

final class PriceView: GenericView {

    // MARK: Var

    lazy var salePriceLabel = UILabel()
        .with
        .textAlignment(.right)
        .textColor(.lightGray)
        .font(.systemFont(ofSize: 12, weight: .semibold))
        .lineBreakMode(.byWordWrapping)
        .text(L10n.Product.priceStartingAt)
        .build()

    lazy var fullPriceLabel = UILabel()
        .with
        .textAlignment(.right)
        .textColor(.peixeUrbanoOrange)
        .font(.systemFont(ofSize: 13, weight: .semibold))
        .lineBreakMode(.byWordWrapping)
        .build()

    lazy var stackView = UIStackView()
        .with
        .axis(.horizontal)
        .alignment(.center)
        .distribution(.equalCentering)
        .spacing(0)
        .build()

    lazy var nestedStackView = UIStackView()
        .with
        .axis(.vertical)
        .alignment(.trailing)
        .distribution(.fill)
        .build()

    // MARK: Init

    override func initSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(nestedStackView)
        nestedStackView.addArrangedSubview(salePriceLabel)
        nestedStackView.addArrangedSubview(fullPriceLabel)
    }

    override func initConstraints() {
        stackView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.bottom.equalToSuperView()
        }
    }
}

extension PriceView: ContentConvertible {

    typealias Content = Deal

    func clear() {
        fullPriceLabel.text = ""
    }

    func setup(with data: Deal) {
        fullPriceLabel.text = data.salePrice.toCurrency
    }
}
