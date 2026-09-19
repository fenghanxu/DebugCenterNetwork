//
//  EndTaskModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/8/14.
//

import Foundation

class EndTaskModel: Codable {

    var message: String?
    var data: EndTaskDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class EndTaskDataModel: Codable {

}
