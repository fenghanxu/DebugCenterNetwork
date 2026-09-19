//
//  LeaveSubmitModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/9/10.
//

import Foundation

class LeaveSubmitModel: Codable {

    var message: String?
    var data: LeaveSubmitDataModel?
    var code: Int?

    enum CodingKeys: String, CodingKey {
        case message
        case data
        case code
    }
}

class LeaveSubmitDataModel: Codable {

    var idData: Int?
    var driver: LeaveSubmitDriverModel?
    var approvalBy: String?
    var updateBy: Int?
    var deleteBy: Int?
    var driverId: Int?
    var createAt: String?
    var typeData: Int?
    var endDate: String?
    var approvalStatus: Int?
    var source: Int?
    var updateAt: String?
    var remark: String?
    var deleteAt: String?
    var approvalTime: String?
    var startDate: String?
    var approvalRemark: String?
    var createBy: Int?

    enum CodingKeys: String, CodingKey {
        case idData = "id"
        case driver
        case approvalBy
        case updateBy
        case deleteBy
        case driverId
        case createAt
        case typeData = "type"
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

class LeaveSubmitDriverModel: Codable {

    var employeeId: Int?
    var licenseExpiryDate: String?
    var boundCompanyId: Int?
    var age: Int?
    var updateBy: Int?
    var deleteBy: Int?
    var company: LeaveSubmitCompanyModel?
    var createAt: String?
    var pslId: String?
    var employee: LeaveSubmitEmployeeModel?
    var driverType: Int?
    var licenseIssueDate: String?
    var updateAt: String?
    var licenseNumber: String?
    var deleteAt: String?
    var status: Int?
    var createBy: Int?

    enum CodingKeys: String, CodingKey {
        case employeeId
        case licenseExpiryDate
        case boundCompanyId
        case age
        case updateBy
        case deleteBy
        case company
        case createAt
        case pslId
        case employee
        case driverType
        case licenseIssueDate
        case updateAt
        case licenseNumber
        case deleteAt
        case status
        case createBy
    }
}

class LeaveSubmitEmployeeModel: Codable {

    var storeInfoId: String?
    var userId: Int?
    var departmentId: Int?
    var position: String?
    var user: LeaveSubmitUserModel?

    enum CodingKeys: String, CodingKey {
        case storeInfoId = "store_info_id"
        case userId = "user_id"
        case departmentId = "department_id"
        case position
        case user
    }
}

class LeaveSubmitUserModel: Codable {

    var authority: LeaveSubmitAuthorityModel?
    var birthday: String?
    var deleteBy: Int?
    var status: Int?
    var agentCode: String?
    var authorities: String?
    var region: Int?
    var realName: String?
    var createAt: String?
    var updateAt: String?
    var uuid: String?
    var phoneAreaCode: String?
    var typeUser: Int?
    var idUser: Int?
    var gender: Int?
    var createBy: Int?
    var updateBy: Int?
    var phone: String?
    var email: String?
    var lastLoginTime: Int?
    var deleteAt: String?
    var remarks: String?
    var userName: String?
    var authorityId: Int?
    var headerImg: String?

    enum CodingKeys: String, CodingKey {
        case authority
        case birthday
        case deleteBy
        case status
        case agentCode
        case authorities
        case region
        case realName
        case createAt
        case updateAt
        case uuid
        case phoneAreaCode
        case typeUser = "type"
        case idUser = "id"
        case gender
        case createBy
        case updateBy
        case phone
        case email
        case lastLoginTime
        case deleteAt
        case remarks
        case userName
        case authorityId
        case headerImg
    }
}

class LeaveSubmitAuthorityModel: Codable {

    var createdAt: String?
    var authorityId: Int?
    var authorityName: String?
    var parentId: String?
    var children: String?
    var menus: String?
    var defaultRouter: String?
    var deletedAt: String?
    var dataAuthorityId: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case createdAt = "CreatedAt"
        case authorityId
        case authorityName
        case parentId
        case children
        case menus
        case defaultRouter
        case deletedAt = "DeletedAt"
        case dataAuthorityId
        case updatedAt = "UpdatedAt"
    }
}

class LeaveSubmitCompanyModel: Codable {

    var idCompany: Int?
    var createBy: Int?
    var documents: String?
    var updateBy: Int?
    var deleteBy: Int?
    var permits: String?
    var qualification: String?
    var createAt: String?
    var address: String?
    var updateAt: String?
    var deleteAt: String?
    var quota: Int?
    var name: String?
    var status: Int?

    enum CodingKeys: String, CodingKey {
        case idCompany = "id"
        case createBy
        case documents
        case updateBy
        case deleteBy
        case permits
        case qualification
        case createAt
        case address
        case updateAt
        case deleteAt
        case quota
        case name
        case status
    }
}
