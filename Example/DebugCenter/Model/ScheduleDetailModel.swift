//
//  ScheduleDetailModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/7/16.
//

import Foundation

class ScheduleDetailModel: Codable {

    var message: String?
    var data: ScheduleDetailDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class ScheduleDetailDataModel: Codable {

    var vehicleInfo: ScheduleDetailVehicleInfoModel?
    var routerId: Int?
    var tripId: Int?
    var tripDepartureTime: String?
    var stations: [ScheduleDetailStationsModel]?
    var driverInfo: ScheduleDetailDriverInfoModel?
    var tripScheduleInId: Int?
    var checkingStatus: Int?
    var routerName: String?
    var tripName: String?

    enum CodingKeys: String, CodingKey {
        case vehicleInfo
        case routerId
        case tripId
        case tripDepartureTime
        case stations
        case driverInfo
        case tripScheduleInId
        case checkingStatus
        case routerName
        case tripName
    }
}

class ScheduleDetailDriverInfoModel: Codable {

    var driverId: Int?
    var phone: String?
    var driverName: String?

    enum CodingKeys: String, CodingKey {
        case driverId
        case phone
        case driverName
    }
}

class ScheduleDetailStationsModel: Codable {

    var departureTime: String?
    var stationId: Int?
    var boardPassengerCount: Int?
    var alightPassengerCount: Int?
    var traditionalChineseName: String?
    var isBoard: Bool?
    var simplifiedChineseName: String?
    var checkedPassengerCount: Int?
    var isAlight: Bool?
    var shouldCheckPassengerCount: Int?
    var sequence: Int?
    var englishName: String?

    enum CodingKeys: String, CodingKey {
        case departureTime
        case stationId
        case boardPassengerCount
        case alightPassengerCount
        case traditionalChineseName
        case isBoard
        case simplifiedChineseName
        case checkedPassengerCount
        case isAlight
        case shouldCheckPassengerCount
        case sequence
        case englishName
    }
}

class ScheduleDetailVehicleInfoModel: Codable {

    var vehicleId: Int?
    var mainlandPlate: String?
    var seats: Int?
    var hkPlate: String?

    enum CodingKeys: String, CodingKey {
        case vehicleId
        case mainlandPlate
        case seats
        case hkPlate
    }
}
