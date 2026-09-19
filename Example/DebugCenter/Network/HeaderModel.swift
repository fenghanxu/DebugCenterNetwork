//
//  HeaderModel.swift
//  DebugCenter_Example
//
//  Created by imac on 2026/9/13.
//  Copyright © 2026 CocoaPods. All rights reserved.
//

import UIKit

class HeaderModel: NSObject {
    
    public static let `default` = HeaderModel()
    
    func header_default() -> [String : String] {
        var headerParams = [String: String]()
        headerParams["Content-Type"] = "application/json"
        headerParams["Accept"] = "application/json"
        return headerParams
    }

    
    func header_token() -> [String : String] {
        var headerParams = [String: String]()
        headerParams["Content-Type"] = "application/json"
        headerParams["Accept"] = "application/json"
        if let token = LoginModel.default.data?.token {
            headerParams["Authorization"] = "Bearer \(String(describing: token))"
        }
        return headerParams
    }

}
