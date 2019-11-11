//
//  UIViewController+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public extension UIViewController {
    func changeStatusBar(_ color: UIColor) {
        if #available(iOS 13.0, *) {
            let statusbarView = UIView()
                .with
                .backgroundColor(color)
                .build()

            view.addSubview(statusbarView)
            statusbarView.layout {
                $0.height.constraint(equalToConstant: UIApplication.shared.statusBarFrame.size.height)
                $0.top.equalToSuperView()
                $0.centerX.equalToSuperView()
                $0.width.constraint(equalToConstant: UIApplication.shared.statusBarFrame.size.width)
            }
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath:
                "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = color
        }
    }
}
