//
//  ListConfiguration.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Domain

struct Configuration {
    var decorator: NavigationBarDecorator
    var fetcher: Domain.ListFetcher
    var notifier: NavigationBarBadge
}
