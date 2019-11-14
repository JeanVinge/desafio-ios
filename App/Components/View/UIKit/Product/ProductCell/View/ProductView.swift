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

final class ProductView: GenericView, Bindable {

    // MARK: Var

    typealias Presenter = ProductItemPresenter

    var presenter: ProductItemPresenter?

    lazy var topImageView = TopImageView()
    lazy var bottomView = BottomView()

    // MARK: Init

    override func initSubviews() {
        addSubviews(topImageView,
                    bottomView)
        topImageView.likeButton.addTarget(self,
            action: #selector(didLike),
            for: .touchUpInside)
    }

    func moduleDidLoad(_ forceRefresh: Bool) {
        guard let presenter = presenter else { return }
        presenter.transform().deal.observe { [weak self] result in
            guard let self = self,
                let deal = try? result.get() else { return }
            self.configure(deal)
        }
    }

    override func initConstraints() {
        topImageView.layout {
            $0.top.equalToSuperView()
            $0.left.equalToSuperView()
            $0.right.equalToSuperView()
        }
        bottomView.layout {
            $0.top.equal(to: topImageView.bottomAnchor,
                         offsetBy: 10)
            $0.left.equalToSuperView(20)
            $0.right.equalToSuperView(-20)
            $0.bottom.equalToSuperView(-10)
        }
    }

    // MARK: Actions

    @objc func didLike() {
        presenter?.select(topImageView.likeButton.isSelected)
    }
}

extension ProductView: TableCellConvertible {

    // MARK: Var

    typealias Content = ProductItemPresenter

    // MARK: Init

    func setup(with data: ProductItemPresenter) {
        setup(data)
    }

    func configure(_ tableViewCell: UITableViewCell) {
        tableViewCell.selectionStyle = .none
    }

    func prepareForReuse() {
        topImageView.clear()
        bottomView.clear()
        presenter = nil
    }

    private func configure(_ deal: Deal) {
        bottomView.setup(with: deal)
        topImageView.setup(with: deal)
    }
}

typealias ProductCell = TableViewCell<ProductView>
