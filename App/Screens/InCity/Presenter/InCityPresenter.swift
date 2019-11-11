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

    let listUseCases = ProductListUseCases()

    struct Input {
        let observer: Promise<[Deal]>
    }

    typealias Output = Void

    // MARK: Init

    func transform(_ input: Input) {
        listUseCases.inCity().observe { result in
            switch result {
            case let .success(products):
                input.observer.resolve(with: products.response.deals)
            case let .failure(error):
                input.observer.reject(with: error)
            }
        }
    }
}
