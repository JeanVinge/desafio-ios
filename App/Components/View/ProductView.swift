//
//  ProductView.swift
//  desafio-ios
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Domain
import Kingfisher

final class ProductView: GenericView {

    // MARK: Var

    lazy var imageView = UIImageView()
        .with
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()

    lazy var titleLabel = UILabel()
        .with
        .textColor(.white)
        .build()

    lazy var descriptionLabel = UILabel()
        .with
        .numberOfLines(0)
        .build()
    lazy var salePriceLabel = UILabel()
    lazy var fullPriceLabel = UILabel()

    // MARK: Init

    override func initSubviews() {
        addSubviews(imageView,
                    titleLabel,
                    descriptionLabel,
                    salePriceLabel,
                    fullPriceLabel)
    }

    override func initConstraints() {
        imageView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
            $0.height.constraint(equalToConstant: 240)
        }
        descriptionLabel.layout {
            $0.top.equal(to: imageView.bottomAnchor,
                         offsetBy: 10)
            $0.left.equalToSuperView(20)
            $0.right.equalToSuperView(-20)
            $0.bottom.equalToSuperView(-10)
        }
    }

}

extension ProductView: TableCellConvertible {

    // MARK: Var

    typealias Content = Deal

    // MARK: Init

    func setup(with data: Deal) {
        descriptionLabel.text = data.description
        imageView.kf.setImage(with: data.imageURL)
    }
}

typealias ProductCell = TableViewCell<ProductView>
