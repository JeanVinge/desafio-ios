//
//  StoredObject.swift
//  Persistence
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public protocol StoredObject {
    associatedtype Primitive
    func toPrimitive() -> Primitive?
    static func from(primitive: Primitive) -> Self?
}
