//
//  ViewController.swift
//  Utility
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public protocol ControllerObserver {
    func viewDidLoad()
    func viewDidAppear(_ animated: Bool)
}

public extension ControllerObserver {
    func viewDidLoad() {}
    func viewDidAppear(_ animated: Bool) {}
}

final public class ViewController<T: UIView>: UIViewController {

    // MARK: Var

    public lazy var baseView: T = T()
    var observer: ControllerObserver?

    // MARK: Init

    required public init(_ title: String = "",
                         tabbarImage: UIImage? = nil,
                         observer: ControllerObserver? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.title = title
        tabBarItem.image = tabbarImage
        self.observer = observer
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        observer?.viewDidAppear(animated)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        observer?.viewDidLoad()
    }

    override public func loadView() {
        self.view = baseView
    }
}
