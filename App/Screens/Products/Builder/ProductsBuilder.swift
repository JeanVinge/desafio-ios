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

struct ProductsBuilder: ControllerBuilder {

    // MARK: Init

    static func build() -> UIViewController {
        return ViewController<ProductsView>(L10n.Tabbar.products,
                                            tabbarImage: Asset.icBag.image)
    }
}
