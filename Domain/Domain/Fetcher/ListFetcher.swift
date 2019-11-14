//
//  ListFetcher.swift
//  Domain
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future

public protocol ListFetcher {

    var useCase: Domain.ListUseCases { get }
    var persistence: Persistence { get }

    func products(_ forceRefresh: Bool) -> Future<ProductList>
    func store(_ deal: Deal)
    func productList() -> ProductList
}

public extension ListFetcher {
    func store(_ deal: Deal) {
        guard let productList = persistence.instance.get() else { return }
        let deals = productList.response.deals.map { nDeal in
            return nDeal == deal ? deal : nDeal
        }
        persistence.instance.set(ProductList(productList.code,
                                             response: List(deals)))
    }

    func productList() -> ProductList {
        return persistence.instance.get() ?? ProductList.empty
    }

    private func handleProductList(_ promise: Promise<ProductList>,
                                   error: Error? = nil) {
        if let productList = persistence.instance.get() {
            promise.resolve(with: productList)
        } else if let error = error {
            promise.reject(with: error)
        } else {
            request(promise)
        }
    }

    func products(_ forceRefresh: Bool) -> Future<ProductList> {
        return handleStore(forceRefresh)
    }

    // MARK: Helpers

    private func handleResult(_ promise: Promise<ProductList>,
                              result: FutureResult<ProductList>) {
        switch result {
        case let .success(productList):
            promise.resolve(with: productList)
        case let .failure(error):
            handleProductList(promise, error: error)
        }
    }

    private func handleStore(_ forceRefresh: Bool) -> Future<ProductList> {
        let promise = Promise<ProductList>()
        if forceRefresh {
            request(promise)
        } else {
            handleProductList(promise)
        }
        return promise
    }

    private func request(_ promise: Promise<ProductList>) {
        useCase.products().save(persistence).observe { result in
            self.handleResult(promise,
                         result: result)
        }
    }
}
