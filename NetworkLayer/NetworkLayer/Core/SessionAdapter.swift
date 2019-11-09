//
//  SessionAdapter.swift
//  Networking
//
//  Created by jean.vinge on 16/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public struct SessionAdapter {

    // MARK: Var

    private static let timeoutInterval: TimeInterval = 15

    // MARK: Init

    private static func configuration() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = timeoutInterval
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return configuration
    }

    public static func session() -> URLSession {
        return URLSession(configuration: SessionAdapter.configuration())
    }
}
