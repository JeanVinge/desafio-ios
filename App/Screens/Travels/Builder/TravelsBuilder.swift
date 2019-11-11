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

    // MARK: Init

    static func build() -> UIViewController {
        return ViewController<TravelsView>(L10n.Tabbar.travels,
                                           tabbarImage: Asset.icPlane.image)
    }
}
