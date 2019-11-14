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
    var decorator: NavigationBarDecorator { get }
    var fetcher: Domain.ListFetcher { get }
    var notifier: NavigationBarBadge { get }

    init(decorator: NavigationBarDecorator,
         fetcher: Domain.ListFetcher,
         notifier: NavigationBarBadge)
}

extension ListConfiguration {
    init(decorator: NavigationBarDecorator,
         fetcher: Domain.ListFetcher,
         notifier: NavigationBarBadge) {
        self.init(decorator: decorator,
                  fetcher: fetcher,
                  notifier: notifier)
    }
}

struct ContreteConfiguration: ListConfiguration {
    var decorator: NavigationBarDecorator
    var fetcher: Domain.ListFetcher
    var notifier: NavigationBarBadge
}
