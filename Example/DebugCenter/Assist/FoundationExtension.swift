//
//  FoundationExtension.swift
//  celebrate
//
//  Created by admin on 2024/4/18.
//

import Foundation

// 扩展Dictionary，用于编码请求参数
extension Dictionary {
    /*
     这个方法用于将字典中的键值对转换为URL查询参数格式并进行百分比编码，最终返回一个Data对象
     实际上我们写代码的时候传递的是一个字典，接口发送后台最终打包的是data（二进制）所以需要转换，第三方只是帮我们做好而已
     */
    func percent_encoded() -> Data? {
        return map { key, value in
            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .url_query_value_allowed) ?? ""
            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .url_query_value_allowed) ?? ""
            return escapedKey + "=" + escapedValue
        }
        .joined(separator: "&")
        .data(using: .utf8)
    }
}

extension CharacterSet {
    /*
     有一些特殊字符是允许的，但在某些上下文中需要进行编码，以确保URL的正确性
     这个字符集移除了在URL查询参数中需要编码的特殊字符，而保留了其他大多数字符
     具体来说，它移除了一些通用分隔符（如: # [] @）和一些子分隔符（如! $ & '() * +,; =）
     这样，当我们对URL中的查询参数值进行编码时，可以使用这个字符集来确保URL的正确性
     */
    static let url_query_value_allowed: CharacterSet = {
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        
        var allowed = CharacterSet.urlQueryAllowed
        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return allowed
    }()
}

