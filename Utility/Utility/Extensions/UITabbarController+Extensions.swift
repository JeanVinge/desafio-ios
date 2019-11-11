//
//  UITabbarController+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public extension UITabBarController {
    func setTabBarHidden(_ isHidden: Bool,
                         animated: Bool = true,
                         completion: EmptyCompletion? = nil) {
        if tabBar.isHidden == isHidden {
            completion?()
        }

        if !isHidden {
            tabBar.isHidden = false
        }

        let height = tabBar.frame.size.height
        let offsetY = view.frame.height - (isHidden ? 0 : height)
        let duration = (animated ? 0.25 : 0.0)

        let frame = CGRect(origin: CGPoint(x: tabBar.frame.minX, y: offsetY), size: tabBar.frame.size)
        UIView.animate(withDuration: duration, animations: {
            self.tabBar.frame = frame
        }, completion: { _ in
            self.tabBar.isHidden = isHidden
            completion?()
        })
    }
}
