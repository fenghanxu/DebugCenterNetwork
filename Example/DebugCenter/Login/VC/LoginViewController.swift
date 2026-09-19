//
//  LoginViewController.swift
//  DebugCenter_Example
//
//  Created by imac on 2026/9/14.
//  Copyright © 2026 CocoaPods. All rights reserved.
//

import UIKit
import DebugCenter

class LoginViewController: UIViewController {
    
    var list = [String]()
    var captchaCodeImage = String()
    var captchaId = String()
    var captchaCode = String()
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["获取验证码","登录","获取员工乘车码及当天乘车次数","查询应用当前启用版本记录"]
        buildUI()
        requestData()
    }
    
    private func buildUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.backgroundColor = .white
        tableView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.register(LoginCell.self, forCellReuseIdentifier: LoginCell.identifier)
        tableView.register(LoginCaptchaCell.self, forCellReuseIdentifier: LoginCaptchaCell.identifier)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNormalMagnitude))
        tableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
        tableView.sectionHeaderHeight = CGFloat.leastNormalMagnitude
        tableView.estimatedRowHeight = 0.0;
        tableView.estimatedSectionFooterHeight = 0.0
        tableView.estimatedSectionHeaderHeight = 0.0
    }
    
    private func requestData() {
        BaseNetwork.default.request(api: Api.verificationCode) { (model: VerificationCodeModel?, error: String?) in
            if let model = model {
                self.captchaCodeImage = model.data.picPath
                self.captchaId = model.data.captchaId
                self.tableView.reloadData()
            } else {
                print(error ?? "")
            }
        }
    }
    
}


extension LoginViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if list[indexPath.item] == "获取验证码" {
            return 80
        } else if list[indexPath.item] == "登录" {
            return 60
        } else {
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if list[indexPath.item] == "登录" {
            let cell = LoginCaptchaCell.cell(with: tableView)
            cell.titleLabel.text = list[indexPath.item]
            cell.delegate = self
            return cell
        } else {
            if list[indexPath.item] == "获取验证码" {
                let cell = LoginCell.cell(with: tableView)
                cell.titleLabel.text = list[indexPath.item]
                if list[indexPath.item] == "获取验证码" && self.captchaCodeImage != String() {
                    let base64String = self.captchaCodeImage.replacingOccurrences(of: "data:image/png;base64,", with: "")
                    if let data = Data(base64Encoded: base64String),
                       let image = UIImage(data: data) {
                        cell.icon.image = image
                    }
                }
                cell.icon.backgroundColor = .gray.withAlphaComponent(0.2)
                cell.icon.isHidden = false
                return cell
            } else {
                let cell = LoginCell.cell(with: tableView)
                cell.titleLabel.text = list[indexPath.item]
                cell.icon.isHidden = true
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if list[indexPath.item] == "获取验证码" {
            BaseNetwork.default.request(api: Api.verificationCode) { (model: VerificationCodeModel?, error: String?) in
                if let model = model {
                    self.captchaCodeImage = model.data.picPath
                    self.captchaId = model.data.captchaId
                    self.tableView.reloadData()
                } else {
                    print(error ?? "")
                }
            }
        } else if list[indexPath.item] == "登录" {
            let params = [
                "username" : ConfigMessage.default.driverAccount_7,
                "password" : ConfigMessage.default.driverPassword_7,
                "captcha" : captchaCode,
                "captchaId" : captchaId
            ]
            
            BaseNetwork.default.request(api: Api.login(params)) { (model: LoginModel?, error: String?) in
                if let model = model {
                    if model.code == 0 {
                        LoginModel.default = model
                        LoginModel.default.archive(model)
                    }
                } else {
                    print(error ?? "")
                }
            }
        } else if list[indexPath.item] == "获取员工乘车码及当天乘车次数" {
            BaseNetwork.default.request(api: Api.getEmployeeQrCodeByApp([String :  Any]())) { (model: EmployeeQRCodeModel?, error: String?) in
                
            }
        } else if list[indexPath.item] == "查询应用当前启用版本记录" {
            let params: [String: Any] = [
                "appType": 3,
                "appPlatform": 5
            ]
            BaseNetwork.default.request(api: Api.getActiveVersion(params)) { (model: VersionDetailModel?, error: String?) in
                
            }
        }
    }
    
}

extension LoginViewController: LoginCaptchaCellDelegate {
    func loginCaptchaCell(model: LoginCaptchaCell, success value: String) {
        self.captchaCode = value
    }
}
