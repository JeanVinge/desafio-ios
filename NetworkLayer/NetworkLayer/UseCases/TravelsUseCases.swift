//
//  TravelsUseCases.swift
//  NetworkLayer
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future
import Domain

public struct TravelsUseCases: Domain.ListUseCases {

    // MARK: Var

    let service: Service

    // MARK: Init

    public init(_ service: Service = Service()) {
        self.service = service
    }

    public func products() -> Future<ProductList> {
        return service
            .request(ListTargetType.travels)
            .map(ProductList.self)
    }
}
