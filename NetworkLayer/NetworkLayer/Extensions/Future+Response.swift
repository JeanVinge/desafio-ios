//
//  Future+Extensions.swift
//  NetworkLayer
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future

public extension Future where Value == Response {
    func map<T: Codable>(_ type: T.Type) -> Future<T> {
        return chained { response in
            let promise = Promise<T>()
            do {
                promise.resolve(with: try response.map(type))
                return promise
            } catch let error {
                promise.reject(with: error)
            }
            return promise
        }
    }
}
