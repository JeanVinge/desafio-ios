//
//  UIColor+Extensions.swift
//  Resources
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public extension UIColor {
    class var peixeUrbanoBlue: UIColor {
        return UIColor(3, green: 105, blue: 199)
    }
    class var peixeUrbanoOrange: UIColor {
        return UIColor(231, green: 102, blue: 38)
    }

     convenience init(_ red: CGFloat,
                      green: CGFloat,
                      blue: CGFloat,
                      alpha: CGFloat = 1) {
        self.init(
            red: red / 255,
            green: green / 255,
            blue: blue / 255,
            alpha: alpha
        )
    }
}
