//
//  TravelsPresenter.swift
//  App
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation
import NetworkLayer
import Utility
import Future
import Domain

struct TravelsPresenter: Presenter {

    // MARK: Var

    struct Input {
        let observer: Promise<[Deal]>
        let fetcher: Domain.ListFetcher = ListFetcher()
    }

    typealias Output = Void

    // MARK: Init

    func transform(_ input: Input) {
        input.fetcher.travels().observe { result in
            switch result {
            case let .success(products):
                input.observer.resolve(with: products.response.deals)
            case let .failure(error):
                input.observer.reject(with: error)
            }
        }
    }
}
