//
//  ProductListUseCases.swift
//  Domain
//
//  Created by jean.vinge on 09/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future

public protocol ProductListUseCases {
    func inCity() -> Future<ProductList>
    func travels() -> Future<ProductList>
    func products() -> Future<ProductList>
}

