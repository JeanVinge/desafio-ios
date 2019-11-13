//
//  Double+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public extension Double {
    var toCurrency: String? {
        return NumberFormatter(.currency).string(for: self)
    }
}
