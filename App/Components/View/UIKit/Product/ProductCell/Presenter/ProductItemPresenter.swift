//
//  ProductItemPresenter.swift
//  App
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Future
import Domain

struct ProductItemPresenter: Presenter {

    // MARK: Var

    let deal: Deal
    let selection: SelectProduct

    typealias Input = Void

    struct Output {
        let deal: SelectProduct
    }

    // MARK: Init

    init(_ deal: Deal,
         selection: Promise<Deal>) {
        self.deal = deal
        self.selection = selection
    }

    func transform() -> Output {
        return Output(deal: Promise<Deal>(value: deal))
    }

    func select(_ isSelect: Bool) {
        selection.resolve(with: Deal(deal, isLiked: isSelect))
    }
}
