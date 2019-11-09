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

    let deals: [Deal]
}

public typealias ProductList = Response<List>
