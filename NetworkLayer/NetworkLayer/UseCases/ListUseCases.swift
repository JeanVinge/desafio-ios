//
//  ProductListUseCases.swift
//  NetworkLayer
//
//  Created by jean.vinge on 09/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future
import Domain

public struct ListUseCases: Domain.ListUseCases {

    // MARK: Var

    let service: Service

    // MARK: Init

    public init(_ service: Service = Service()) {
        self.service = service
    }

    public func inCity() -> Future<ProductList> {
        return service
            .request(ListTargetType.inCityList)
            .map(ProductList.self)
    }

    public func travels() -> Future<ProductList> {
        return service
            .request(ListTargetType.travels)
            .map(ProductList.self)
    }

    public func products() -> Future<ProductList> {
        return service
            .request(ListTargetType.products)
            .map(ProductList.self)
    }
}

extension Future where Value == ProductList {
    func save(_ key: Persistence) -> Future<Value> {
        return chained { productList in
            key.instance.set(productList)
            return Promise<Value>(value: productList)
        }
    }
}
