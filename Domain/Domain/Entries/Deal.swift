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
        case description = "short_title"
        case imageURL = "dealImage"
        case title = "email_subject"
        case fullPrice = "full_price"
        case salePrice = "sale_price"
    }

    let title: String
    let description: String
    let imageURL: URL
    let fullPrice: Double
    let salePrice: Double
}
