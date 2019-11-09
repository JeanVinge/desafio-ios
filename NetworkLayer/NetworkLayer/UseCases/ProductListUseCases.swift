//
//  ProductListUseCases.swift
//  NetworkLayer
//
//  Created by jean.vinge on 09/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future
import Domain

public struct ProductListUseCases: Domain.ProductListUseCases {

    // MARK: Init

    public init() {}

    public func list() -> Future<ProductList> {
        return Service().request(ListTargetType.inCityList).transformed { try $0.map(ProductList.self) }
    }
}
