//
//  ProductListViewBuilder.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility

struct ProductListViewBuilder: ControllerBuilder {

    // MARK: Var

    let item: ProductItemBuilder

    // MARK: Init

    func build() -> UIViewController {
        let buttons = NavigationBarButtons(heartButton: item.heartButton)
        let presenter = ProductListPresenter(
                ContreteConfiguration(
                    navigation: buttons,
                    fetcher: item.fetcher,
                    notifyBarButton: item.notifyBarButton
                )
            )
        let vc = ProductListViewController(item.tabbarTitle, tabbarImage: item.tabbarImage)
        vc.baseView.setup(presenter)
        let nav = NavigationController(rootViewController: vc)
        buttons.insert(in: vc)
        return nav
    }
}
