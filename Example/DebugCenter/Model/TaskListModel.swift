//
//  TaskListModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/6/24.
//

import UIKit

class TaskListDriverInfoModel :Codable{
       var driverName: String?
       var phone: String?
       var company: String?
       var driverId: Int?

}

class TaskListBusInfoModel  :Codable{
       var vehicleId: Int?
       var mainlandPlate: String?
       var plateNumber: String?
       var vehicleName: String?
       var hkPlate: String?
       var company: String?
       var seats: Int?

}

class TaskListStopsModel :Codable{
       var stationName: String?
       var departureTime: String?
       var stationId: Int?

}

class TaskListLineInfoModel :Codable{
       var routeName: String?
       var routerId: Int?
       var entryPortId: Int?
       var estimatedDurationMinutes: Int?
       var routeDirection: Int?
       var stops: [TaskListStopsModel]?
       var routerType: Int?
       var entryPortName: String?

}

class TaskListDataModel :Codable{
       var idData: Int?
       var routerType: String?
       var driverInfo: TaskListDriverInfoModel?
       var classNum: String?
       var endTime: String?
       var origin: String?
       var busInfo: TaskListBusInfoModel?
       var destination: String?
       var workOrderNo: String?
       var stopStationCount: Int?
       var startTime: String?
       var dispatchStatus: Int?// 1:待执行， 2:执行中， 3:已完成
       var lineInfo: TaskListLineInfoModel?
       var type: String? // 工单类型：班车，跟车，演唱会业务，加油，临时派车，带路/试线，包车，送检送修
       var businessCode: String? // 工单类型ID
       var vehicleEndTime: String? // 工单结束时间
       var driverEndTime: String? // 驾驶结束时间

    enum CodingKeys: String, CodingKey {
        case idData = "id"
        case routerType
        case driverInfo
        case classNum
        case endTime
        case origin
        case busInfo
        case destination
        case workOrderNo
        case stopStationCount
        case startTime
        case dispatchStatus
        case lineInfo
        case type
        case businessCode
        case vehicleEndTime
        case driverEndTime
    }
}

class TaskListModel :Codable{
       var message: String?
       var data: [TaskListDataModel]?
       var code: Int?

}
