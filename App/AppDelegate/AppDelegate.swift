//
//  AppDelegate.swift
//  desafio-ios
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Var

    let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)

    // MARK: Init

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MainCoordinator(window).start()
        return true
    }
}
