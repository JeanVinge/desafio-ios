//
//  ConfigurableView.swift
//  Utility
//
//  Created by Jean Vinge on 15/06/2018.
//  Copyright © 2018 Jean Vinge. All rights reserved.
//

import UIKit

public protocol ConfigurableView {
    func initLayout()
    func initSubviews()
    func initConstraints()
}

public extension ConfigurableView where Self: UIViewController {
    func initLayout() {
        initSubviews()
        initConstraints()
    }
}

public extension ConfigurableView where Self: UIView {
    func initLayout() {
        initSubviews()
        initConstraints()
    }
}
