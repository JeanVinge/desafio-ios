//
//  TravelsBuilder.swift
//  desafio-ios
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Resources

struct TravelsBuilder: ControllerBuilder {

    // MARK: Var

    let heartButton: BadgeBarButtonItem
    let notifier: NavigationBarBadge

    // MARK: Init

    func build() -> UIViewController {
        return ProductListViewBuilder(
            item:
            TravelsViewBuilder(
                heartButton: heartButton,
                tabbarTitle: L10n.Tabbar.travels,
                tabbarImage: Asset.icPlane.image,
                notifier: notifier
            )
        ).build()
    }
}
