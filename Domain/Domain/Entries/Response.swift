//
//  Response.swift
//  Domain
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public struct Response<T: Codable>: Codable {

    // MARK: Var

    public let code: Int
    public let response: T

    public init(_ code: Int = 0,
                response: T) {
        self.code = code
        self.response = response
    }
}
