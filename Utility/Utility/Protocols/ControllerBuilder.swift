//
//  ControllerBuilder.swift
//  Utility
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public protocol ControllerBuilder {
    associatedtype Controller = UIViewController
    static func build() -> Controller
}
