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
        let decorator = NavigationBarDecorator(heartButton: item.heartButton)
        let vc = ProductListViewController(item.tabbarTitle, tabbarImage: item.tabbarImage)
        vc.baseView.setup(ProductListPresenter(
            Configuration(
                decorator: decorator,
                fetcher: item.fetcher,
                notifier: item.notifier)
            )
        )
        let navigation = NavigationController(rootViewController: vc)
        decorator.insert(in: vc)
        return navigation
    }
}
