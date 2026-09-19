//
//  StartTaskModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/8/14.
//

import Foundation

class StartTaskModel: Codable {

    var message: String?
    var data: StartTaskDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class StartTaskDataModel: Codable {

}
