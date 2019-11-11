//
//  NavigationController.swift
//  Utility
//
//  Created by jean.vinge on 10/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public final class NavigationController: UINavigationController {

    // MARK: Init

    public init(_ titleView: UIView,
                inViewController rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        navigationItem.titleView = titleView
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
