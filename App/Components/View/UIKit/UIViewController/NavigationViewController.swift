//
//  NavigationViewController.swift
//  App
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility

final class NavigationController: UINavigationController, ConfigurableView {

    // MARK: Var

    var direction: Direction = .down

    // MARK: Init

    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
        changeStatusBar(.peixeUrbanoBlue)
    }

    func initSubviews() {
        navigationBar.tintColor = .white
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .peixeUrbanoBlue
        hidesBarsOnSwipe = true
        barHideOnSwipeGestureRecognizer.addTarget(self, action: #selector(swipeGesture(_:)))
    }

    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func initConstraints() {}

    @objc func swipeGesture(_ gesture: UIPanGestureRecognizer) {
        if gesture.direction != direction {
            tabBarController?.setTabBarHidden(gesture.direction == .up, animated: true)
        }
        direction = gesture.direction ?? .down
    }
}
