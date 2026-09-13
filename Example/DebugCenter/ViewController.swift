//
//  ViewController.swift
//  DebugCenter
//
//  Created by fenghanxu on 08/12/2026.
//  Copyright (c) 2026 fenghanxu. All rights reserved.
//

import UIKit
import DebugCenter
import Alamofire

class ViewController: UIViewController {
    
    private var logTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        URLSession_shared_dataTask()
        
    }
    
    func URLSession_shared_dataTask(){

        guard let url = URL(string: "https://airkoon.cn/eebusApi/tripSchedule/getTripScheduleListByStationOperation") else {
            return
        }

        var request = URLRequest(url: url)

        request.httpMethod = "POST"

        let token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYwLCJvcmciOjAsInJvbGUiOiIiLCJVc2VybmFtZSI6IuWRqOWHryIsIlJlYWxOYW1lIjoiIiwiQXV0aG9yaXR5SWQiOjAsImF1dGhvcml0eUlkcyI6WzgsNV0sIklEIjoxNjAsIlVVSUQiOiI2YmY1NDU3NC0wYjI1LTQ2MzUtOTYyYS04NzZhNTc2OTAxZGEiLCJCdWZmZXJUaW1lIjo2MDQ4MDAsImlzcyI6ImFpcmtvb24iLCJhdWQiOlsiRUVCVVMiXSwiZXhwIjoxNzkxMDgyNzIyLCJuYmYiOjE3ODg0OTA3MjJ9.WLxMLVE9bW8aU9A0NKk52gqZ1M7DHe8eIoYtprMVECI"

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )

        request.setValue(
            "application/json",
            forHTTPHeaderField: "Accept"
        )

        request.setValue(
            token,
            forHTTPHeaderField: "Authorization"
        )

        let params: [String: Any] = [
            "date": "2026-09-05",
            "stationId": 15
        ]

        do {

            request.httpBody = try JSONSerialization.data(
                withJSONObject: params,
                options: []
            )

        } catch {

            print("JSON 参数转换失败：\(error)")
            return
        }

        URLSession.shared.dataTask(
            with: request
        ) { data, response, error in

            if let error {
                print("请求失败：\(error)")
                return
            }

            if let response = response as? HTTPURLResponse {
                print("HTTP 状态码：\(response.statusCode)")
            }

            guard let data else {
                print("没有返回数据")
                return
            }

            print("业务收到回调")

            if let jsonString = String(
                data: data,
                encoding: .utf8
            ) {
                print("返回数据：\(jsonString)")
            }

        }.resume()
    }
 
}

