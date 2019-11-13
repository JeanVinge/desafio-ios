//
//  InCityPresenter.swift
//  desafio-ios
//
//  Created by jean.vinge on 10/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation
import NetworkLayer
import Utility
import Future
import Domain

struct InCityPresenter: Presenter {

    // MARK: Var

    struct Input {
        let observer: Promise<[Deal]>
        let fetcher: Domain.ListFetcher = ListFetcher()
    }

    typealias Output = Void

    // MARK: Init

    func transform(_ input: Input) {
        input.fetcher.inCity().observe { result in
            switch result {
            case let .success(productList):
                input.observer.resolve(with: productList.response.deals)
            case let .failure(error):
                input.observer.reject(with: error)
            }
        }
    }
}
