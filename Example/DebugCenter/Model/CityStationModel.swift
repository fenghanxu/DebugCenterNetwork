//
//  CityStationModel.swift
//  BusMate
//
//  Created by fenghanxu on 2026/6/12.
//

import UIKit

class CityStationLocationModel :Codable{
    var type: String?
    var coordinates: [CGFloat]?
    
    init(){}
    
}

class CityStationStationListModel  :Codable{
    var stationId: Int?
    var entryPortId: Int?
    var location: CityStationLocationModel?
    var stationName: String?
    
    init(){}
    
}

class CityStationDataModel :Codable{
    var stationList: [CityStationStationListModel] = []
    var cityId: Int?
    var cityName: String?
    
    init(){}
    
}

class CityStationModel :Codable{

    var message: String?
    var data: [CityStationDataModel]?
    var code: Int?
    
    init(){}

}
