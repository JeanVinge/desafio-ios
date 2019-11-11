//
//  UIBarButtonItem+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    convenience init(_ image: UIImage,
                     style: UIBarButtonItem.Style = .plain,
                     target: Any? = nil,
                     action: Selector? = nil) {
        self.init(image: image,
                  style: style,
                  target: target,
                  action: action)
    }
}
