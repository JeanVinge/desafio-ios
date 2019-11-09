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

    let code: Int
    let response: T
}
