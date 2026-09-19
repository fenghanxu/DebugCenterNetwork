//
//  LeaveCancelModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/9/14.
//

import UIKit

class LeaveCancelModel: Codable {

    var message: String?
    var data: LeaveCancelDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class LeaveCancelDataModel: Codable {

}
