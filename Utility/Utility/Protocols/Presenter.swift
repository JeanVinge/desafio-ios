//
//  Presenter.swift
//  Utility
//
//  Created by jean.vinge on 10/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public protocol Presenter {
    associatedtype Input
    associatedtype Output
    func transform(_ input: Input) -> Output
}

public protocol Bindable: class {
    associatedtype Presenter

    var presenter: Presenter? { get set }

    func setup(_ presenter: Presenter)
}

public extension Bindable where Self: UIView {
    func setup(_ presenter: Presenter) {
        self.presenter = presenter
        layoutIfNeeded()
    }
}
