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

typealias NavigationBarPromise = Promise<Void>

final class HomeCoordinator: NSObject, Coordinator {

    // MARK: Var

    let tabbarController: UITabBarController

    let heartButton = BadgeBarButtonItem(Asset.icHeart.image)
    var selection = NavigationBarPromise()

    var viewControllers: [UIViewController] {
        return [
            InCityBuilder(heartButton: heartButton,
                          notifyBarButton: selection).build(),
            TravelsBuilder(heartButton: heartButton,
                           notifyBarButton: selection).build(),
            ProductsBuilder(heartButton: heartButton,
                            notifyBarButton: selection).build()
        ]
    }

    // MARK: Init

    init(tabbarController: UITabBarController) {
        self.tabbarController = tabbarController
        super.init()
        selection.observe { _ in
            self.notify()
        }
    }

    func notify() {
        let count = Persistence
            .allCases
            .map { $0.instance.get()?.selectedCount }
            .compactMap { $0 }
            .reduce(0, +)
        selectNavigation(count)
    }

    func selectNavigation(_ count: Int) {
        heartButton.setBadge(count)
    }

    func start() {
        tabbarController.setViewControllers(viewControllers,
                                            animated: false)
    }
}
