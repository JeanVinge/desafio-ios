//
//  StoredObject+Extensions.swift
//  Persistence
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

extension String: StoredAsSelf {
    public typealias Primitive = String
}

extension Int: StoredAsSelf {
    public typealias Primitive = Int
}

extension Float: StoredAsSelf {
    public typealias Primitive = Float
}
