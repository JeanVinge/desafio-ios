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

    // MARK: Var

    let heartButton: BadgeBarButtonItem
    let notifier: NavigationBarBadge

    // MARK: Init

    func build() -> UIViewController {
        return ProductListViewBuilder(
            item:
            InCityViewBuilder(
                heartButton: heartButton,
                tabbarTitle: L10n.Tabbar.icTheCity,
                tabbarImage: Asset.icBuilding.image,
                notifier: notifier
            )
        ).build()
    }
}
