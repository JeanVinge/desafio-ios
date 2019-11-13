//
//  StoredAsSelf.swift
//  Persistence
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public protocol StoredAsSelf: StoredObject where Primitive == Self { }

public extension StoredAsSelf {
    func toPrimitive() -> Primitive? {
        return self
    }
    static func from(primitive: Primitive) -> Primitive? {
        return primitive
    }
}
