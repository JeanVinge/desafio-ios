//
//  MainBuilder.swift
//  desafio-ios
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility

struct MainBuilder: ControllerBuilder {

    // MARK: Var

    typealias Controller = UITabBarController

    // MARK: Init

    static func build() -> UITabBarController {
        return UITabBarController()
    }
}
