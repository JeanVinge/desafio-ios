//
//  UIPanGestureRecognizer+Extensions.swift
//  Utility
//
//  Created by jean.vinge on 11/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public enum Direction {
    case up
    case down
    case left
    case right
}

public extension UIPanGestureRecognizer {
    var direction: Direction? {
        let speed = velocity(in: view)
        let isVertical = abs(speed.y) > abs(speed.x)

        switch (isVertical, speed.x, speed.y) {
        case (true, _, let y) where y < 0:
            return .up
        case (true, _, let y) where y > 0:
            return .down
        case (false, let x, _) where x > 0:
            return .right
        case (false, let x, _) where x < 0:
            return .left
        default:
            return nil
        }
    }
}
