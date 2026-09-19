//
//  EmployeeQRCodeModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/8/19.
//

import Foundation

class EmployeeQRCodeModel: Codable {

    var message: String?
    var data: EmployeeQRCodeDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class EmployeeQRCodeDataModel: Codable {

    var dailyLimit: Int?
    var qrCodeInfo: String?
    var rideNumber: Int?
    var remainingRides: Int?

    enum CodingKeys: String, CodingKey {
        case dailyLimit
        case qrCodeInfo
        case rideNumber
        case remainingRides
    }
}
