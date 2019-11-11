//
//  ViewController.swift
//  Utility
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

final public class ViewController<T: UIView>: UIViewController {

    // MARK: Var

    public lazy var baseView: T = T()

    // MARK: Init

    required public init(_ title: String = "",
                         tabbarImage: UIImage? = nil) {
        super.init(nibName: nil, bundle: nil)
        tabBarItem.title = title
        tabBarItem.image = tabbarImage
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override public func loadView() {
        self.view = baseView
    }
}
