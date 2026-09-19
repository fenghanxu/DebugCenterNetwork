//
//  VersionDetailModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/9/4.
//

import UIKit

class VersionDetailModel: Codable {

    var code: Int?
    var data: VersionDetailDataModel?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case code
        case data
        case message
    }
}

class VersionDetailDataModel: Codable {

    var idData: Int?
    var createBy: Int?
    var createAt: String?
    var updateBy: Int?
    var updateAt: String?
    var deleteBy: Int?
    var deleteAt: String?
    var appType: Int?
    var appPlatform: Int?
    var versionNumber: String?
    var newFeatures: String?
    var optimizedFeatures: String?
    var fixedBugs: String?
    var releaseTime: String?
    var isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case idData = "id"
        case createBy
        case createAt
        case updateBy
        case updateAt
        case deleteBy
        case deleteAt
        case appType
        case appPlatform
        case versionNumber
        case newFeatures
        case optimizedFeatures
        case fixedBugs
        case releaseTime
        case isActive
    }
}
