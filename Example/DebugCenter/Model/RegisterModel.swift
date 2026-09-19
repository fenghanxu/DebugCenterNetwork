//
//  RegisterModel.swift
//  EternalEastBus
//
//  Created by 冯汉栩 on 2026/4/29.
//

import UIKit

class RegisterModel: Codable {

    init(){}

    var message: String!
    var data: DataRegisterModel!
    var code: Int = 0
}

class DataRegisterModel :Codable{
    init(){}

    var user: UserRegisterModel!
}

class UserRegisterModel :Codable{
    init(){}

    var authority: AuthorityRegisterModel!
    var birthday: String!
    var deleteBy: Int = 0
    var status: Int = 0
    var agentCode: String!
    var authorities: String!
    var region: Int = 0
    var realName: String!
    var createAt: String!
    var updateAt: String!
    var uuid: String!
    var userType: Int = 0
    var type: Int = 0
    var id: Int = 0
    var gender: Int = 0
    var createBy: Int = 0
    var updateBy: Int = 0
    var phone: String!
    var email: String!
    var lastLoginTime: Int = 0
    var deleteAt: String!
    var remarks: String!
    var userName: String!
    var authorityId: Int = 0
    var headerImg: String!
}

class AuthorityRegisterModel :Codable{
    init(){}

    var createdAt: String!
    var authorityId: Int = 0
    var authorityName: String!
    var parentId: String!
    var children: String!
    var menus: String!
    var defaultRouter: String!
    var deletedAt: String!
    var dataAuthorityId: String!
    var updatedAt: String!
}
