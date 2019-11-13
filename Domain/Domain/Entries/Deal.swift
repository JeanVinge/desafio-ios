//
//  Deal.swift
//  Domain
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import Foundation

public struct Deal: Codable {

    // MARK: Var

    enum CodingKeys: String, CodingKey {
        case id = "deal_id"
        case title = "email_subject"
        case description = "short_title"
        case imageURL = "dealImage"
        case fullPrice = "full_price"
        case salePrice = "sale_price"
    }

    public let id: String
    public let title: String
    public let description: String
    public let imageURL: URL
    public let fullPrice: Double
    public let salePrice: Double

    public var isLiked: Bool = false

    init(_ deal: Deal) {
        id = deal.id
        title = deal.title
        description = deal.title
        imageURL = deal.imageURL
        fullPrice = deal.fullPrice
        salePrice = deal.salePrice
        isLiked = true
    }
}

extension Deal: Equatable {
    public static func == (lhs: Deal, rhs: Deal) -> Bool {
        return lhs.id == rhs.id &&
            lhs.description == rhs.description
    }
}
