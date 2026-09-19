//
//  TicketManagementModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/6/9.
//

import UIKit

class TicketManagementDataModel :Codable{

    var ticketCheckStatus: Int?
    var statusCount: Int?
    
    init(){}
}

class TicketManagementModel :Codable{

    var message: String?
    var data: [TicketManagementDataModel]?
    var code: Int?

    init(){}
}

extension TicketManagementModel {

    func normalizeData() {

        if data == nil {
            data = []
        }

        if !(data?.contains(where: { $0.ticketCheckStatus == 1 }) ?? false) {
            let model = TicketManagementDataModel()
            model.ticketCheckStatus = 1
            model.statusCount = 0
            data?.append(model)
        }

        if !(data?.contains(where: { $0.ticketCheckStatus == 2 }) ?? false) {
            let model = TicketManagementDataModel()
            model.ticketCheckStatus = 2
            model.statusCount = 0
            data?.append(model)
        }
    }
}
