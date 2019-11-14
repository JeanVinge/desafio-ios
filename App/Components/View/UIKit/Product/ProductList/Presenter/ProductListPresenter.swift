//
//  ProductListPresenter.swift
//  App
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation
import Domain

struct ProductListPresenter: ListPresenter {

    // MARK: Var

    typealias Input = ProductInput
    typealias Output = ProductOutput

    var configuration: Configuration

    // MARK: Init

    init(_ configuration: Configuration) {
        self.configuration = configuration
    }

    // MARK: Init

    func transform(_ input: Input) -> Output {
        return toOutput(input)
    }

    private func selection(_ input: Input,
                           deal: Deal) {
        configuration.fetcher.store(deal)
        input.reloadItems.resolve(with: configuration.fetcher.toPresenter(input.trigger))
        configuration.notifier.update()
    }

    private func result(_ input: Input,
                        result: ResultProductsPresenter) {
        guard let presenter = try? result.get() else { return }
        configuration.notifier.update()
        input.list.resolve(with: presenter)
    }

    func toOutput(_ input: ProductInput) -> ProductOutput {
        configuration
            .fetcher
            .toPresenter(
                input.trigger,
                forceRefresh: input.forceRefresh
        ).observe { result in
            self.result(input, result: result)
        }
        input.trigger.observe { result in
            guard let deal = try? result.get() else { return }
            self.selection(input, deal: deal)
        }
        return ProductOutput(list: input.list,
                             reloadItems: input.reloadItems)
    }
}
