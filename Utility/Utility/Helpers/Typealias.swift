//
//  Typealias.swift
//  Utility
//
//  Created by jean.vinge on 07/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public typealias ReusableTableViewCell = UITableViewCell & Reusable
public typealias TableViewRepresentation = UIView & TableCellConvertible
public typealias EmptyCompletion = (() -> Void)
