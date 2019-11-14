//
//  ProductItemBuilder.swift
//  App
//
//  Created by jean.vinge on 13/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit
import Utility
import Domain
import NetworkLayer

protocol ProductItemBuilder {
    var heartButton: BadgeBarButtonItem { get }
    var tabbarTitle: String { get }
    var tabbarImage: UIImage? { get }
    var fetcher: Domain.ListFetcher { get }
    var notifyBarButton: NavigationBarPromise { get }
}

struct ProductsViewBuilder: ProductItemBuilder {
    var heartButton: BadgeBarButtonItem
    var tabbarTitle: String
    var tabbarImage: UIImage?
    var fetcher: ListFetcher = ProductsFetcher()
    var notifyBarButton: NavigationBarPromise
}

struct TravelsViewBuilder: ProductItemBuilder {
    var heartButton: BadgeBarButtonItem
    var tabbarTitle: String
    var tabbarImage: UIImage?
    var fetcher: ListFetcher = TravelsFetcher()
    var notifyBarButton: NavigationBarPromise
}

struct InCityViewBuilder: ProductItemBuilder {
    var heartButton: BadgeBarButtonItem
    var tabbarTitle: String
    var tabbarImage: UIImage?
    var fetcher: ListFetcher = InCityFetcher()
    var notifyBarButton: NavigationBarPromise
}
