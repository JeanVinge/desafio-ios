//
//  TopImageView.swift
//  App
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Domain
import Resources
import Kingfisher

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
        clipsToBounds = true
    }

    override func initConstraints() {
        imageView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
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

extension TopImageView: ContentConvertible {

    typealias Content = Deal

    func clear() {
        titleLabel.text = ""
        imageView.kf.cancelDownloadTask()
    }

    func setup(with data: Deal) {
        titleLabel.text = data.title
        imageView.kf.setImage(with: data.imageURL,
                              placeholder: Asset.icPlaceholder.image)
        likeButton.isSelected = data.isSelected
    }
}
