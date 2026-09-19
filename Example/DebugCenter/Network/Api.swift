//
//  Api.swift
//  DebugCenter_Example
//
//  Created by imac on 2026/9/14.
//  Copyright © 2026 CocoaPods. All rights reserved.
//

import UIKit

enum Api {
    // 验证码
    case verificationCode
    // 登录
    case login(_ params: [String: Any])
    // 获取员工乘车码及当天乘车次数
    case getEmployeeQrCodeByApp(_ params: [String : Any])
    // 查询应用当前启用版本记录
    case getActiveVersion(_ params: [String : Any])
}

extension Api: TargetType {

    var base_url: String {
        return ConfigMessage.default.baseURL
    }

    var path: String {
        switch self {
        case .login:
            return "/base/login"
        case .verificationCode:
            return "/base/captcha"
        case .getEmployeeQrCodeByApp:
            return "/employee/getEmployeeQrCodeByApp"
        case .getActiveVersion:
            return "/appVersionRecord/getActiveVersion"
        }
    }

    var method: String {
        switch self {
        case .login,
                .getEmployeeQrCodeByApp,
                .getActiveVersion,
                .verificationCode:
            return "POST"
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .login(let params):
            return params
        case .getEmployeeQrCodeByApp(let params):
            return params
        case .getActiveVersion(let params):
            return params
        case .verificationCode:
            return [:]
        }
    }

    var headers: [String: String]? {
        switch self {
        case .verificationCode,
                .login:
            return HeaderModel.default.header_default()
        case .getEmployeeQrCodeByApp,
                .getActiveVersion:
            return HeaderModel.default.header_token()
        }
    }
}
