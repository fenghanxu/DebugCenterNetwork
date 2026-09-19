//
//  LeaveListModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/9/11.
//

import UIKit

class LeaveListModel: Codable {

    var message: String?
    var data: LeaveListDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class LeaveListDataModel: Codable {

    var currPage: Int?
    var list: [LeaveListListModel]?
    var pageSize: Int?
    var totalCount: Int?
    var totalPage: Int?

    enum CodingKeys: String, CodingKey {
        case currPage
        case list
        case pageSize
        case totalCount
        case totalPage
    }
}

class LeaveListListModel: Codable {

    var idList: Int?
    var driver: LeaveListDriverModel?
    var approvalBy: String?
    var updateBy: Int?
    var deleteBy: Int?
    var driverId: Int?
    var applyTime: String?
    var createAt: String?
    var typeList: Int?
    var endDate: String?
    var approvalStatus: Int? // 1: 待审核 2: 已通过 3: 已驳回 4:已取消
    var source: Int?
    var updateAt: String?
    var remark: String?
    var deleteAt: String?
    var approvalTime: String?
    var startDate: String?
    var approvalRemark: String?
    var createBy: Int?

    enum CodingKeys: String, CodingKey {
        case idList = "id"
        case driver
        case approvalBy
        case updateBy
        case deleteBy
        case driverId
        case applyTime
        case createAt
        case typeList = "type"
        case endDate
        case approvalStatus
        case source
        case updateAt
        case remark
        case deleteAt
        case approvalTime
        case startDate
        case approvalRemark
        case createBy
    }
}

class LeaveListDriverModel: Codable {

    var employeeId: Int?
    var licenseExpiryDate: String?
    var boundCompanyId: Int?
    var age: Int?
    var updateBy: Int?
    var deleteBy: Int?
    var createAt: String?
    var pslId: String?
    var driverType: Int?
    var licenseIssueDate: String?
    var updateAt: String?
    var deleteAt: String?
    var licenseNumber: String?
    var status: Int?
    var createBy: Int?

    enum CodingKeys: String, CodingKey {
        case employeeId
        case licenseExpiryDate
        case boundCompanyId
        case age
        case updateBy
        case deleteBy
        case createAt
        case pslId
        case driverType
        case licenseIssueDate
        case updateAt
        case deleteAt
        case licenseNumber
        case status
        case createBy
    }
}
