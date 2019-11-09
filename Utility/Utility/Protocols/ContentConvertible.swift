//
//  ContentCellConvertible.swift
//  Utility
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public protocol ContentConvertible {
    associatedtype Content = Void

    init()

    func setup(with data: Content)
    func prepareForReuse()
}

extension ContentConvertible where Content == Void {
    public func setup(with data: Content) {}
}

public protocol CellConvertible: ContentConvertible {
    func prepareForReuse()
}

public extension CellConvertible {
    func prepareForReuse() {}
}

public protocol TableCellConvertible: CellConvertible {
    func configure(_ tableViewCell: UITableViewCell)
}

public extension TableCellConvertible {
    func configure(_ tableViewCell: UITableViewCell) {}
}
