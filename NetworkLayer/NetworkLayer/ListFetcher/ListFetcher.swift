//
//  ListFetcher.swift
//  NetworkLayer
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future
import Domain

public struct ListFetcher: Domain.ListFetcher {

    // MARK: Var

    let useCase: Domain.ListUseCases

    // MARK: Init

    public init(_ useCase: Domain.ListUseCases = ListUseCases()) {
        self.useCase = useCase
    }

    public func inCity() -> Future<ProductList> {
        let promise = Promise<ProductList>()
        let persistence = Persistence.inCity
        useCase.inCity().save(persistence).observe { result in
            self.handleResult(promise,
                         persistence: persistence,
                         result: result)
        }
        return promise
    }

    public func travels() -> Future<ProductList> {
        let promise = Promise<ProductList>()
        let persistence = Persistence.travels
        useCase.travels().save(persistence).observe { result in
            self.handleResult(promise,
                              persistence: persistence,
                              result: result)
        }
        return promise
    }

    public func products() -> Future<ProductList> {
                let promise = Promise<ProductList>()
        let persistence = Persistence.products
        useCase.products().save(persistence).observe { result in
            self.handleResult(promise,
                         persistence: persistence,
                         result: result)
        }
        return promise
    }

    // MARK: Helper

    private func handleResult(_ promise: Promise<ProductList>,
                              persistence: Persistence,
                              result: FutureResult<ProductList>) {
        switch result {
        case let .success(productList):
            promise.resolve(with: productList)
        case let .failure(error):
            if let productList = persistence.instance.get() {
                promise.resolve(with: productList)
            } else {
                promise.reject(with: error)
            }
        }
    }
}
