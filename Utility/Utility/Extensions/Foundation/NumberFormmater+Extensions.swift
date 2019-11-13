//
//  NumberFormmater+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public extension NumberFormatter {
    convenience init(_ numberStyle: NumberFormatter.Style,
                     locale: Locale = Locale(identifier: "pt_BR")) {
        self.init()
        self.numberStyle = numberStyle
        self.locale = locale
    }
}
