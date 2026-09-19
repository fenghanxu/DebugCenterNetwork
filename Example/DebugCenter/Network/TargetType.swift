//
//  TargetType.swift
//  celebrate
//
//  Created by admin on 2024/4/18.
//

import Foundation

public protocol TargetType {
    
    var base_url: String { get }
    
    var path: String { get }
    
    var method: String { get }
    
    var headers: [String: String]? { get }
    
    var parameters: [String: Any]? { get }
}
