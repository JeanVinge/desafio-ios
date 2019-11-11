//
//  NavigationBarButtons.swift
//  App
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Resources

struct NavigationBarButtons {
    static func insert(in viewController: UIViewController) {
        viewController.navigationItem.setLeftBarButton(
            UIBarButtonItem(customView: CityButton("Florianopolis")),
            animated: false)
        viewController.navigationItem.setRightBarButtonItems([
            UIBarButtonItem(Asset.icCart.image),
            UIBarButtonItem(Asset.icHeart.image),
            UIBarButtonItem(Asset.icFilter.image)
        ], animated: false)
    }
}
