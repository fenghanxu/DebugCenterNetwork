//
//  AccountPasswordModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/7/27.
//

import UIKit

class AccountPasswordModel: Codable {
    
    static var `default` = AccountPasswordModel()
    
    var account: String?
    var password: String?
    
    func archive(_ accountPasswordModel: AccountPasswordModel) {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("AccountPasswordModel.json")
    }

}
