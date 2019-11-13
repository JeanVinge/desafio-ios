//
//  ListTargetType.swift
//  NetworkLayer
//
//  Created by jean.vinge on 08/11/19.
//  Copyright © 2019 jean.vinge. All rights reserved.
//

import UIKit

public enum ListTargetType {
    case inCityList
    case travels
    case products
}

extension ListTargetType: TargetType {
    public var path: String {
        switch self {
        case .inCityList:
            return "2b1f747ebeb9070e33818bf857e28a84/raw/5da63767fda2ec16f4ae0718e3be4be75001fe10/florianopolis.json"
        case .travels:
            return "d2665b556f2be1b1ad3a19d2ef9bcc44/raw/afe1e0a9563e3bcddc3796b22becb8f12f82ee2e/viagens.json"
        case .products:
        return "007fd6664650391dca199e6784d1f351/raw/862d701c69307f9e9053f8cb1ec438586fca4b64/produtos.json"
        }
    }

    public var method: Method {
        return .get
    }

    public var task: Task {
        return .requestParameters(parameters: [:], encoding: URLEncoding())
    }
}
