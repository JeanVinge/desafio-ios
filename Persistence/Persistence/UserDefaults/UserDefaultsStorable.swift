//
//  Storable.swift
//  Persistence
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public struct UserDefaultsStorable<Object> where Object: StoredObject {

    // MARK: Var

    private let key: PersistenceKey
    private let store = UserDefaults.standard

    // MARK: Init

    public init(_ key: PersistenceKey) {
        self.key = key
    }

    public func set(_ object: Object) {
        store.set(object.toPrimitive(), forKey: key.name())
    }

    public func get() -> Object? {
        guard let p = store.value(forKey: key.name()) as? Object.Primitive else { return nil }
        return .from(primitive: p)
    }
}

public protocol PersistenceKey {
    func name() -> String
}
