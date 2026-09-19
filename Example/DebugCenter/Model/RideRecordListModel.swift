//
//  RideRecordListModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/8/20.
//

import UIKit

class RideRecordListModel: Codable {

    var message: String?
    var data: RideRecordListDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class RideRecordListDataModel: Codable {

    var dailyLimit: Int?
    var rideNumber: Int?
    var groups: [RideRecordListGroupsModel]?
    var remainingRides: Int?
    var date: String?

    enum CodingKeys: String, CodingKey {
        case dailyLimit
        case rideNumber
        case groups
        case remainingRides
        case date
    }
}

class RideRecordListGroupsModel: Codable {

    var date: String?
    var records: [RideRecordListRecordsModel]?

    enum CodingKeys: String, CodingKey {
        case date
        case records
    }
}

class RideRecordListRecordsModel: Codable {

    var tripId: Int?
    var routerId: Int?
    var stationNameTraditional: String?
    var idRecords: Int?
    var routeName: String?
    var stationNameEnglish: String?
    var stationName: String?
    var tripName: String?
    var stationId: Int?
    var checkTime: String?

    enum CodingKeys: String, CodingKey {
        case tripId
        case routerId
        case stationNameTraditional
        case idRecords = "id"
        case routeName
        case stationNameEnglish
        case stationName
        case tripName
        case stationId
        case checkTime
    }
}
