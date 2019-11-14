//
//  Future+ProductList.swift
//  NetworkLayer
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future

public extension Future where Value == ProductList {
    func save(_ key: Persistence) -> Future<Value> {
        return chained { productList in
            key.instance.set(productList)
            return Promise<Value>(value: productList)
        }
    }
}
