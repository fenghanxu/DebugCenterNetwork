//
//  VerificationCodeModel.swift
//  EternalEastBus
//
//  Created by 冯汉栩 on 2026/4/28.
//

import UIKit

class VerificationCodeModel :Codable{
    var message: String = String()
    var data: VerificationCodeModelData = VerificationCodeModelData()
    var code: Int = 0

    init(){}
}

class VerificationCodeModelData :Codable{
    var picPath: String = String()
    var captchaLength: Int = 0
    var openCaptcha: Bool = false
    var captchaId: String = String()

    init(){} 

}
