//
//  LoginModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/6/23.
//

import UIKit

class LoginStationModel :Codable{
       var location: String?
       var simplifiedChineseName: String?
       var deleteBy: Int?
       @StringValue
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
        case location
        case simplifiedChineseName
        case deleteBy
        case entryPortId
        case cityStationId
        case createAt
        case updateAt
        case traditionalChineseName
        case sequenceNumber
        case entryPort
        case id
        case createBy
        case updateBy
        case simplifiedChineseAddress
        case englishAddress
        case deleteAt
        case englishName
        case traditionalChineseAddress
        case cityStation
        case stationDescription = "description"
    }
}

class LoginStoreInfoModel :Codable{
       var id: Int?
       var stationId: Int?
       var managerUser: String?
       var createBy: Int?
       var updateBy: Int?
       var deleteBy: Int?
       var createAt: String?
       var managerId: Int?
       var employees: String?
       var updateAt: String?
       var deleteAt: String?
       var machinesAccounts: String?
       var stores: String?
       var name: String?
       var station: LoginStationModel?

}

class LoginDepartmentModel :Codable{
       var default_authority_id: Int?
       var createBy: Int?
       var id: Int?
       var deleteBy: Int?
       var updateBy: Int?
       var employees: String?
       var createAt: String?
       var deleteAt: String?
       var name: String?
       var updateAt: String?

}

class LoginEmployeeModel  :Codable{
       var store_info_id: Int?
       var position: String?
       var store_info: LoginStoreInfoModel?
       var department_id: Int?
       var user_id: Int?
       var department: LoginDepartmentModel?
       var user: LoginUserModel?

}

class LoginAuthorityModel  :Codable{
       var CreatedAt: String?
       var authorityId: Int?
        @StringValue
       var parentId: String?
       var children: String?
       var menus: String?
       var defaultRouter: String?
       var UpdatedAt: String?
       var DeletedAt: String?
       var dataAuthorityId: String?
       var authorityName: String?

}

class LoginAuthoritiesModel  :Codable{
       var CreatedAt: String?
       var authorityId: Int?
       var authorityName: String?
       var parentId: Int?
       var children: String?
       var menus: String?
       var defaultRouter: String?
       var DeletedAt: String?
       var dataAuthorityId: String?
       var UpdatedAt: String?
}

class LoginUserModel :Codable{
       var authority: LoginAuthorityModel?
       var birthday: String?
       var deleteBy: Int?
       var status: Int?
       var agentCode: String?
       var authorities: [LoginAuthoritiesModel]?
       var region: Int?
       var realName: String?
       var createAt: String?
       var updateAt: String?
       var uuid: String?
       var userType: Int?
       var type: Int?
       var id: Int?
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

}

class LoginDataModel :Codable{
       var employee: LoginEmployeeModel?
       var expiresAt: Int?
       var user: LoginUserModel?
       var isStationStaff: Bool?
       var token: String?
       var isDriver: Bool?

}

class LoginModel :Codable{
    static var `default` = LoginModel()
    
       var message: String?
       var data: LoginDataModel?
       var code: Int?

    func archive(_ login: LoginModel) {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("login.json")
        
        let data = try! JSONEncoder().encode(login)
        try! data.write(to: url)
    }
    
    func unarchive() {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            .appendingPathComponent("login.json")
        
        guard let data = try? Data(contentsOf: url) else { return }

        do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
                if let jsonString = String(data: prettyData, encoding: .utf8) {
                    print(jsonString)
            }
            
            let model = try JSONDecoder().decode(LoginModel.self, from: data)
            LoginModel.default = model
            
        } catch {
            return
        }
    }
}




