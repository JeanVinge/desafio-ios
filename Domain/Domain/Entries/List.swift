//
//  List.swift
//  Domain
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public struct List: Codable {

    // MARK: Var

    public let deals: [Deal]

    public init(_ deals: [Deal] = []) {
        self.deals = deals
    }
}

public typealias ProductList = Response<List>

public extension ProductList {
    static var empty: ProductList {
        return ProductList(response: List())
    }
}
