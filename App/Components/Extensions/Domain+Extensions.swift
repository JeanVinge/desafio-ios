//
//  Domain+Extensions.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Domain
import Future

typealias SelectProduct = Promise<Deal>

extension ProductList {
    var selectedCount: Int {
        return response.selectedCount
    }
}

extension List {
    func toPresenter(_ selection: SelectProduct) -> ProductItems {
        return deals.map { ProductItemPresenter($0, selection: selection) }
    }
}

extension Domain.ListFetcher {

    // MARK: Var

    var selectedCount: Int {
        return productList().selectedCount
    }

    // MARK: Init

    func toPresenter(_ selection: SelectProduct) -> ProductItems {
        return productList().response.toPresenter(selection)
    }

    func toPresenter(_ selection: SelectProduct,
                     forceRefresh: Bool = false) -> Future<ProductItems> {
        return products(forceRefresh)
            .transformed { $0.response.toPresenter(selection) }
    }
}
