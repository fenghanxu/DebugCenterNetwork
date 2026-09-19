//
//  CheckTicketModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/6/18.
//

import UIKit

class CheckTicketSegmentScheduleModel :Codable{
       var firstTripDiscount: String?
       var deleteBy: Int?
       var firstTripScheduleObject: String?
       var secondTripPrices: String?
       var firstTripPrices: String?
       var createAt: String?
       var updateAt: String?
       var secondTripDiscount: String?
       var id: Int?
       var date: String?
       var boardingStationId: Int?
       var createBy: Int?
       var updateBy: Int?
       var entryPortScheduleId: String?
       var alightingStationId: Int?
       var isPublish: Bool?
       var firstTripScheduleId: Int?
       var deleteAt: String?
       var stationIds: String?
       var secondTripScheduleId: String?
       var secondTripScheduleObject: String?
       var price: String?
       var isCrossBorderSegmentSchedule: Bool?
       var seatLayout: String?
       var actualPrices: String?
       var availableTickets: Int?

}

class CheckTicketBoardingStationModel :Codable{
       var location: String?
       var simplifiedChineseName: String?
       var deleteBy: Int?
       var entryPortId: String?
       var cityStationId: Int?
       var createAt: String?
       var updateAt: String?
       var traditionalChineseName: String?
       var sequenceNumber: Int?
       var entryPort: String?
       var id: Int?
       var createBy: Int?
       var updateBy: Int?
       var simplifiedChineseAddress: String?
       var englishAddress: String?
       var deleteAt: String?
       var englishName: String?
       var traditionalChineseAddress: String?
       var cityStation: String?
       var stationDescription: String?

    enum CodingKeys: String, CodingKey {
        case stationDescription = "description"
    }
}

class CheckTicketArrivalCityStationModel :Codable{
       var id: Int?
       var parentId: String?
       var createBy: Int?
       var effectiveStartDate: String?
       var updateBy: Int?
       var traditionalChineseName: String?
       var deleteBy: Int?
       var sequenceNumber: Int?
       var createAt: String?
       var effectiveEndDate: String?
       var simplifiedChineseName: String?
       var code: String?
       var IsGoBackOnly: Bool?
       var updateAt: String?
       var children: String?
       var deleteAt: String?
       var englishName: String?

}

class CheckTicketAlightingStationModel :Codable{
       var location: String?
       var simplifiedChineseName: String?
       var deleteBy: Int?
       var entryPortId: String?
       var cityStationId: Int?
       var createAt: String?
       var updateAt: String?
       var traditionalChineseName: String?
       var sequenceNumber: Int?
       var entryPort: String?
       var id: Int?
       var createBy: Int?
       var updateBy: Int?
       var simplifiedChineseAddress: String?
       var englishAddress: String?
       var deleteAt: String?
       var englishName: String?
       var traditionalChineseAddress: String?
       var cityStation: String?
       var stationDescription: String?

    enum CodingKeys: String, CodingKey {
        case stationDescription = "description"
    }
}

class CheckTicketOrderModel :Codable{
       var source: String?
       var deleteBy: Int?
       var status: Int?
       var totalPrice: String?
       var createAt: String?
       var updateAt: String?
       var category: Int?
       var emailAddress: String?
       var tickets: String?
       var id: Int?
       var number: String?
       var createBy: Int?
       var updateBy: Int?
       var phone: String?
       var paymentMethod: Int?
       var deleteAt: String?
       var accountType: Int?
       var ticketVendingTerminal: Int?
       var openRandomCode: String?
       var orderItems: String?

}

class CheckTicketDepartureCityStationModel :Codable{
       var id: Int?
       var parentId: String?
       var createBy: Int?
       var effectiveStartDate: String?
       var updateBy: Int?
       var traditionalChineseName: String?
       var deleteBy: Int?
       var sequenceNumber: Int?
       var createAt: String?
       var effectiveEndDate: String?
       var simplifiedChineseName: String?
       var code: String?
       var IsGoBackOnly: Bool?
       var updateAt: String?
       var children: String?
       var deleteAt: String?
       var englishName: String?

}

class CheckTicketDataModel :Codable{
       var arrivalCityStationId: Int?
       var deleteBy: Int?
       var secondTripSeatNumber: String?
       var segmentSchedule: CheckTicketSegmentScheduleModel?
       var departureCityStationId: Int?
       var boardingStation: CheckTicketBoardingStationModel?
       var arrivalCityStation: CheckTicketArrivalCityStationModel?
       var createAt: String?
       var updateAt: String?
       var category: Int?
       var alightingStation: CheckTicketAlightingStationModel?
       var secondTripId: String?
       var segmentScheduleId: Int?
       var id: Int?
       var boardingStationId: Int?
       var firstTripSeatNumber: String?
       var createBy: Int?
       var updateBy: Int?
       var alightingStationId: Int?
       var departureTime: String?
       var deleteAt: String?
       var firstTripId: Int?
       var passengerName: String?
       var order: CheckTicketOrderModel?
       var departureCityStation: CheckTicketDepartureCityStationModel?
       var price: String?
       var orderId: Int?
       var ticketStatus: Int?

}

class CheckTicketModel :Codable{
       var message: String?
       var data: CheckTicketDataModel?
       var code: Int?

}
