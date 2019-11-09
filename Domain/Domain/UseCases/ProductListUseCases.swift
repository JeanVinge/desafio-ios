//
//  ProductListUseCases.swift
//  Domain
//
//  Created by jean.vinge on 09/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future

public protocol ProductListUseCases {
    func list() -> Future<ProductList>
}

