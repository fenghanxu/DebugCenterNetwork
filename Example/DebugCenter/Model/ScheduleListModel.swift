//
//  ScheduleListModel.swift
//  BusMate
//
//  Created by 冯汉栩 on 2026/5/9.
//

import UIKit

// MARK: - 状态统计

class ScheduleListStatusCountModel: Codable {

    var waiting: Int?
    var checking: Int?
    var departed: Int?

}

// MARK: - 车辆信息

class ScheduleListVehicleInfoModel: Codable {

    var seats: Int?
    var vehicleId: Int?
    var mainlandPlate: String?
    var hkPlate: String?
}

// MARK: - 司机信息

class ScheduleListDriverInfoModel: Codable {

    var driverId: Int?
    var driverName: String?
    var phone: String?

}

// MARK: - 列表项

class ScheduleListListModel: Codable {
    
    var driverInfo:ScheduleListDriverInfoModel?
    var vehicleInfo:ScheduleListVehicleInfoModel?
    var checkingStatus: Int?//检票状态   // nil - 全部, 1-待检票, 2-检票中, 3-已发车
    var classNum: String?
    var tripId: Int? // 班次id
    var scheduleId: Int? // 班次排班id
    var destination: String?
    var workOrderNo: String?
    var departureTime: String?//
    var origin: String?
    var dispatchOrderId: Int?
    var isExtraTrip:Bool?// 是否加班车
    var routerName:String? // 路线
    var isBoardStation:Bool?// 是否是该站点
    var stopStationCount:Int?
    
    // 自定义
    var isSelected: Bool = false

    enum CodingKeys: String, CodingKey {

        case driverInfo
        case vehicleInfo
        case checkingStatus
        case classNum
        case tripId
        case scheduleId
        case destination
        case workOrderNo
        case departureTime
        case origin
        case dispatchOrderId
        case isExtraTrip
        case routerName
        case isBoardStation
        case stopStationCount
    }

}

// MARK: - Data

class ScheduleListDataModel: Codable {

    var statusCount: ScheduleListStatusCountModel?
    var list: [ScheduleListListModel]?
    var filterCount: Int?
    var totalCount: Int?
    var date: String?

}

// MARK: - Root

class ScheduleListModel: Codable {

    var message: String?
    var data: ScheduleListDataModel?
    var code: Int?

}
