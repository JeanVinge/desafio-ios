//
//  ListPresenter.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Domain

protocol ListPresenter {

    var configuration: ListConfiguration { get }

    init(_ configuration: ListConfiguration)
}
