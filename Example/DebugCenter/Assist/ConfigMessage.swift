//
//  ConfigMessage.swift
//  SwiftDemol
//
//  Created by Hao on 2022/7/28.
//

import Foundation
import CoreLocation

class ConfigMessage: NSObject {
    
    static let `default` = ConfigMessage()

    var baseURL = String()
    
    var server: Server = .DebugNetwork
    
    var testLocation = CLLocation(latitude: 22.310264, longitude: 114.175658 )
    
    // 门店_0
    var storeAccount_0 = "陈默"
    var storePassword_0 = "13800138051"
    
    // 门店_1
    var storeAccount_1 = "吴涛"
    var storePassword_1 = "13800138052"
    
    // 门店_2
    var storeAccount_2 = "周凯"
    var storePassword_2 = "13800138053"
    
    // 门店_3
    var storeAccount_3 = "赵飞"
    var storePassword_3 = "13800138054"
    
    // 门店_4
    var storeAccount_4 = "周也"
    var storePassword_4 = "13800138055"
    
    // 车务(司机)

    
    var driverAccount_7 = "郭健"
    var driverPassword_7 = "13800138012"
    
    var driverAccount_8 = "蔡家瑞"
    var driverPassword_8 = "13800138013"
    
    var driverAccount_10 = "李巨立"
    var driverPassword_10 = "36789012"
    
    var driverAccount_11 = "李小宏"
    var driverPassword_11 = "32345678"
    
    var driverAccount_12 = "黎广華"
    var driverPassword_12 = "35678901"
    
    
    enum Server:Int {
        case DebugNetwork = 0
        case ReleaseNetwork
    }
    
}

extension ConfigMessage {

    /**
     https://cellsys.cn:3202/api
     
     https://web.lazygis.cn/eebusApi
     */
    func chooseMessage(_ sever: Server){
        switch sever {
        case .DebugNetwork:
            baseURL  = "https://airkoon.cn/eebusApi"
            
            testLocation = CLLocation(latitude: 22.310264, longitude: 114.175658 )
            
            server = .DebugNetwork

        case .ReleaseNetwork:
            baseURL  = "https://eetest.cpolar.cn/api"
            
            testLocation = CLLocation(latitude: 22.310264, longitude: 114.175658 )
            
            server = .ReleaseNetwork
        }
    }
    
}
