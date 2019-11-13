//
//  ListFetcher.swift
//  Domain
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future

public protocol ListFetcher {
    func inCity() -> Future<ProductList>
    func travels() -> Future<ProductList>
    func products() -> Future<ProductList>
}
