//
//  ProductList+Persistence.swift
//  Domain
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation
import Persistence

extension Response: StoredObject where T == List {

    public typealias Primitive = Data

    public func toPrimitive() -> Data? {
        return try? JSONEncoder().encode(self)
    }

    public static func from(primitive: Data) -> Response<T>? {
        return try? JSONDecoder().decode(Response<T>.self, from: primitive)
    }
}

public enum Persistence: String, PersistenceKey, CaseIterable {
    case inCity
    case travels
    case products

    public func name() -> String {
        return rawValue
    }

    public var instance: UserDefaultsStorable<ProductList> {
        return UserDefaultsStorable<ProductList>(self)
    }
}
