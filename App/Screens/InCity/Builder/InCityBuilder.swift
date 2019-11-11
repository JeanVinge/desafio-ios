//
//  InCityBuilder.swift
//  desafio-ios
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Resources

struct InCityBuilder: ControllerBuilder {

    // MARK: Init

    static func build() -> UIViewController {
        let presenter = InCityPresenter()
        let vc = ViewController<InCityView>(L10n.Tabbar.icTheCity,
                                            tabbarImage: Asset.icBuilding.image)
        vc.baseView.setup(presenter)
        let nav = NavigationController(rootViewController: vc)
        NavigationBarButtons.insert(in: vc)
        return nav
    }
}
