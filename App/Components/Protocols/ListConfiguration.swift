//
//  ListConfiguration.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Domain
import NetworkLayer

protocol ListConfiguration {
    var navigation: NavigationBarButtons { get }
    var fetcher: Domain.ListFetcher { get }
    var notifyBarButton: NavigationBarPromise { get }

    init(navigation: NavigationBarButtons,
         fetcher: Domain.ListFetcher,
         notifyBarButton: NavigationBarPromise)
}

extension ListConfiguration {
    init(navigation: NavigationBarButtons,
         fetcher: Domain.ListFetcher,
         notifyBarButton: NavigationBarPromise) {
        self.init(navigation: navigation,
                  fetcher: fetcher,
                  notifyBarButton: notifyBarButton)
    }
}

struct ContreteConfiguration: ListConfiguration {
    var navigation: NavigationBarButtons
    var fetcher: Domain.ListFetcher
    var notifyBarButton: NavigationBarPromise
}
