//
//  VersionListModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/9/3.
//

import UIKit

class VersionListModel: Codable {

    var code: Int?
    var data: VersionListDataModel?
    var message: String?

    enum CodingKeys: String, CodingKey {
        case code
        case data
        case message
    }
}

class VersionListDataModel: Codable {

    var currPage: Int?
    var pageSize: Int?
    var totalCount: Int?
    var totalPage: Int?
    var list: [VersionListListModel]?

    enum CodingKeys: String, CodingKey {
        case currPage
        case pageSize
        case totalCount
        case totalPage
        case list
    }
}

class VersionListListModel: Codable {

    var idList: Int?
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
        case idList = "id"
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
