//
//  Product+InputOutput.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation
import Future

struct ProductInput {
    let trigger: SelectProduct = SelectProduct()
    let forceRefresh: Bool
    let list: PromiseProductsPresenter = PromiseProductsPresenter()
    let reloadItems: PromiseProductsPresenter = PromiseProductsPresenter()
}

struct ProductOutput {
    let list: PromiseProductsPresenter
    let reloadItems: PromiseProductsPresenter
}

typealias ProductItems = [ProductItemPresenter]
typealias PromiseProductsPresenter = Promise<ProductItems>
typealias FutureProductsPresenter = Future<ProductItems>
typealias ResultProductsPresenter = Result<ProductItems, Error>
