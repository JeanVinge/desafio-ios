//
//  ProductsBuilder.swift
//  desafio-ios
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Resources
import Domain
import NetworkLayer

struct ProductsBuilder: ControllerBuilder {

    // MARK: Var

    let heartButton: BadgeBarButtonItem
    let notifier: NavigationBarBadge

    // MARK: Init

    func build() -> UIViewController {
        return ProductListViewBuilder(
            item:
            ProductsViewBuilder(
                heartButton: heartButton,
                tabbarTitle: L10n.Tabbar.products,
                tabbarImage: Asset.icBag.image,
                notifier: notifier
            )
        ).build()
    }
}
