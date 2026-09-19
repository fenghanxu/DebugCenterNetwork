//
//  TicketHistoryModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/8/21.
//

import UIKit

class TicketHistoryModel: Codable {

    var message: String?
    var data: [TicketHistoryDataModel]?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class TicketHistoryDataModel: Codable {

    var phone: String?
    var orderId: Int?
    var category: Int?
    var emailAddress: String?
    var seatNumber: String?
    var ticketId: Int?
    var passengerName: String?
    var phoneAreaCode: String?
    var ticketCheckStatus: Int?

    enum CodingKeys: String, CodingKey {
        case phone
        case orderId
        case category
        case emailAddress
        case seatNumber
        case ticketId
        case passengerName
        case phoneAreaCode
        case ticketCheckStatus
    }
}
