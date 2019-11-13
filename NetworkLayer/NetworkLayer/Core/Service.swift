//
//  Service.swift
//  Coordinator
//
//  Created by Jean Vinge on 17/01/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

import Future

public final class Service {

    // MARK: Var

    public var session: URLSession
    public var task: URLSessionDataTask?

    // MARK: Init

    public init(_ session: URLSession = SessionAdapter.session()) {
        self.session = session
    }

    func request(_ targetType: TargetType) -> Future<Response> {
        return makeRequest(targetType).transformed { try $0.handleStatusCode() }
    }

    private func makeRequest(_ targetType: TargetType) -> Future<Response> {
        let promise = Promise<Response>()
        do {
            self.task = try session.request(targetType, completion: { (data, response, error) in
                let response = Response(
                    data,
                    response: response,
                    error: error
                )
                if let error = error {
                    promise.reject(with: error)
                } else {
                    promise.resolve(with: response)
                }
            })
            task?.resume()
        } catch let error {
            promise.reject(with: error)
        }
        return promise
    }
}
