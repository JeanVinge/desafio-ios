//
//  MainCoordinator.swift
//  desafio-ios
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility

final class MainCoordinator: Coordinator {

    // MARK: Var

    private lazy var tabbarController = MainBuilder.build()

    // MARK: Init

    init(_ window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = tabbarController
        start()
    }

    func start() {
        HomeCoordinator(tabbarController: tabbarController).start()
    }
}
