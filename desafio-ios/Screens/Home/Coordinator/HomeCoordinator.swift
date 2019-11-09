//
//  HomeCoordinator.swift
//  desafio-ios
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Resources
import Utility

struct HomeCoordinator: Coordinator {

    // MARK: Var

    let tabbarController: UITabBarController
    var viewControllers: [UIViewController] {
        return [
            InCityBuilder.build(),
            TravelsBuilder.build(),
            ProductsBuilder.build()
        ]
    }

    // MARK: Init

    func start() {
        tabbarController.setViewControllers(viewControllers,
                                            animated: false)
    }
}
