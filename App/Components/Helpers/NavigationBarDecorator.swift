//
//  NavigationBarDecorator.swift
//  App
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Resources
import Future
import Domain

struct NavigationBarDecorator {

    // MARK: Var

    let heartButton: BadgeBarButtonItem
    let cityButton = UIBarButtonItem(customView: CityButton("Florianopolis"))
    let cartButton = UIBarButtonItem(Asset.icCart.image)
    let filterButton = UIBarButtonItem(Asset.icFilter.image)

    // MARK: Init

    func insert(in viewController: UIViewController) {
        viewController.navigationItem.setLeftBarButton(
            cityButton,
            animated: false)
        viewController.navigationItem.setRightBarButtonItems([
            cartButton,
            heartButton,
            filterButton
        ], animated: false)
    }
}
