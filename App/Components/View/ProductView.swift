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

    final class PriceView: GenericView {

        // MARK: Var

        lazy var salePriceLabel = UILabel()
        lazy var fullPriceLabel = UILabel()

        // MARK: Init

        override func initSubviews() {
            addSubviews(salePriceLabel,
                        fullPriceLabel)
        }

        override func initConstraints() {
            salePriceLabel.layout {
                $0.top.equalToSuperView()
                $0.left.equalToSuperView()
                $0.right.equalToSuperView()
            }
            fullPriceLabel.layout {
                $0.top.equal(to: salePriceLabel.bottomAnchor)
                $0.left.equalToSuperView()
                $0.right.equalToSuperView()
                $0.bottom.equalToSuperView()
            }
        }
    }

    final class TopImageView: GenericView {

        // MARK: Var

        lazy var imageView = UIImageView()
            .with
            .contentMode(.scaleAspectFill)
            .clipsToBounds(true)
            .build()

        lazy var overlayView = UIView()
            .with
            .backgroundColor(.black)
            .alpha(0.3)
            .build()

        lazy var titleLabel = UILabel()
            .with
            .textColor(.white)
            .font(.systemFont(ofSize: 16, weight: .medium))
            .build()

        lazy var likeButton = LikeButton()

        // MARK: Init

        override func initSubviews() {
            addSubviews(imageView,
                        overlayView,
                        titleLabel,
                        likeButton)
        }

        override func initConstraints() {
            imageView.layout {
                $0.top.equalToSuperView()
                $0.left.equalToSuperView()
                $0.right.equalToSuperView()
                $0.height.constraint(equalToConstant: 240)
                $0.bottom.equalToSuperView()
            }
            overlayView.layout {
                $0.top.equal(to: imageView.topAnchor)
                $0.left.equal(to: imageView.leftAnchor)
                $0.right.equal(to: imageView.rightAnchor)
                $0.bottom.equal(to: imageView.bottomAnchor)
            }
            titleLabel.layout {
                $0.bottom.equal(to: imageView.bottomAnchor, offsetBy: -15)
                $0.left.equalToSuperView(20)
            }
            likeButton.layout {
                $0.bottom.equal(to: titleLabel.bottomAnchor)
                $0.right.equalToSuperView(-20)
            }
        }
    }

    lazy var topImageView = TopImageView()

    lazy var descriptionLabel = UILabel()
        .with
        .numberOfLines(0)
        .build()

    lazy var priceView = PriceView()

    // MARK: Init

    override func initSubviews() {
        addSubviews(topImageView,
                    descriptionLabel,
                    priceView)
    }

    override func initConstraints() {
        topImageView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        priceView.layout {
            $0.top.equal(to: descriptionLabel.topAnchor)
            $0.right.equalToSuperView(-20)
            $0.bottom.equal(to: descriptionLabel.bottomAnchor)
        }
        descriptionLabel.layout {
            $0.top.equal(to: topImageView.bottomAnchor,
                         offsetBy: 10)
            $0.left.equalToSuperView(20)
            $0.right.lessThanOrEqual(to: priceView.leftAnchor)
            $0.bottom.equalToSuperView(-10)
        }
    }
}

extension ProductView: TableCellConvertible {

    // MARK: Var

    typealias Content = Deal

    // MARK: Init

    func setup(with data: Deal) {
        topImageView.titleLabel.text = data.title
        descriptionLabel.text = data.description
        topImageView.imageView.kf.setImage(with: data.imageURL)
        priceView.fullPriceLabel.text = "\(data.salePrice.toCurrency ?? "")"
    }
}

typealias ProductCell = TableViewCell<ProductView>
