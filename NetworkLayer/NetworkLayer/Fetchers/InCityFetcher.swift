//
//  InCityFetcher.swift
//  NetworkLayer
//
//  Created by jean.vinge on 12/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Future
import Domain

public struct InCityFetcher: Domain.ListFetcher {

    // MARK: Var

    public var useCase: Domain.ListUseCases
    public var persistence: Persistence

    // MARK: Init

    public init(_ useCase: Domain.ListUseCases = InCityUseCases(),
                persistence: Persistence = .inCity) {
        self.useCase = useCase
        self.persistence = persistence
    }
}
