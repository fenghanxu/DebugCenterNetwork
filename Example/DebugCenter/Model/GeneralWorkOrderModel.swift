//
//  GeneralWorkOrderModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/8/28.
//

import UIKit

class GeneralWorkOrderModel: Codable {

    var message: String?
    var data: GeneralWorkOrderDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class GeneralWorkOrderDataModel: Codable {

    var idData: Int?
    var vehiclePlate: String?
    var date: String?
    var endTime: String?
    var orderType: String?
    var origin: String?
    var driverName: String?
    var workOrderNo: String?
    var destination: String?
    var startTime: String?
    var dispatchStatus: Int?
    var statusText: String?
    var remark: String?

    enum CodingKeys: String, CodingKey {
        case idData = "id"
        case vehiclePlate
        case date
        case endTime
        case orderType
        case origin
        case driverName
        case workOrderNo
        case destination
        case startTime
        case dispatchStatus
        case statusText
        case remark
    }
}
