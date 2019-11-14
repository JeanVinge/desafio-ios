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
import Future
import Domain

typealias NavigationBarBadge = NavigationBadgeNotifier

protocol NavigationBadgeNotifier {
    func update()
}

struct HomeCoordinator: Coordinator {

    // MARK: Var

    let tabbarController: UITabBarController

    let heartButton = BadgeBarButtonItem(Asset.icHeart.image)

    var viewControllers: [UIViewController] {
        return [
            InCityBuilder(heartButton: heartButton,
                          notifier: self).build(),
            TravelsBuilder(heartButton: heartButton,
                           notifier: self).build(),
            ProductsBuilder(heartButton: heartButton,
                            notifier: self).build()
        ]
    }

    // MARK: Init

    func start() {
        tabbarController.setViewControllers(viewControllers,
                                            animated: false)
    }

    func selectNavigation(_ count: Int) {
        heartButton.setBadge(count)
    }
}

extension HomeCoordinator: NavigationBadgeNotifier {
    
    func update() {
        notify()
    }
    
    func notify() {
        let count = Persistence
            .allCases
            .map { $0.instance.get()?.selectedCount }
            .compactMap { $0 }
            .reduce(0, +)
        selectNavigation(count)
    }
}
