//
//  UITableView+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 22/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import UIKit

extension UITableView {
    public func dequeue<T: ReusableTableViewCell>(
        reusable: T.Type = T.self,
        at indexPath: IndexPath,
        with object: Any? = nil) -> T {
        register(reusable)
        if let cell = dequeueReusableCell(withIdentifier: reusable.reusableIdentifier,
                                          for: indexPath) as? T {
            cell.configure(at: indexPath, with: object)
            return cell
        }
        fatalError(TableViewErrors.cellNotRegistered(reusable.reusableIdentifier).localizedDescription)
    }

    func register<T: ReusableTableViewCell>(_ reusable: T.Type = T.self) {
        register(T.self,
                 forCellReuseIdentifier: reusable.reusableIdentifier)
    }
}
