//
//  BaseNetwork.swift
//  DebugCenter
//

import Foundation
import UIKit

class BaseNetwork: NSObject {
    
    static let `default` = BaseNetwork()
    
    /// 通用网络请求
    /// - Parameters:
    ///   - api: 接口
    ///   - completion: 请求结果
    func request<T: Decodable>(
        api: Api,
        completion: @escaping (T?, String?) -> Void
    ) {
        guard let request = createRequest(api: api) else {
            DispatchQueue.main.async {
                completion(nil, "Invalid URL")
            }
            return
        }

        // 打印请求信息
        print("========== Request ==========")
        print("URL:", request.url?.absoluteString ?? "")
        print("Method:", request.httpMethod ?? "")
        print("Headers:", request.allHTTPHeaderFields ?? [:])

        if let body = request.httpBody {
            print("Body:", String(data: body, encoding: .utf8) ?? "")
        } else {
            print("Body: nil")
        }

        print("=============================")

        URLSession.shared.dataTask(with: request) { data, response, error in

            // 网络错误
            if let error = error {
                print("❌ Network Error:", error)

                DispatchQueue.main.async {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
                return
            }

            // HTTP Response
            guard let httpResponse = response as? HTTPURLResponse else {
                print("❌ Invalid Response")

                DispatchQueue.main.async {
                    completion(nil, "Invalid response")
                }
                return
            }

            // 打印响应
            print("========== Response ==========")
            print("Status Code:", httpResponse.statusCode)
            print("Headers:", httpResponse.allHeaderFields)
            print("Data Count:", data?.count ?? 0)

            if let data = data,
               let string = String(data: data, encoding: .utf8) {
                print("Response Body:")
                print(string)
            }

            print("==============================")

            // HTTP 状态码
            guard (200...299).contains(httpResponse.statusCode) else {
                DispatchQueue.main.async {
                    completion(
                        nil,
                        "Response Error: \(httpResponse.statusCode)"
                    )
                }
                return
            }

            // 判断 Data
            guard let data = data, !data.isEmpty else {
                DispatchQueue.main.async {
                    completion(nil, "Response data is empty")
                }
                return
            }

            // JSON 解码
            do {

                let model = try JSONDecoder().decode(T.self, from: data)

                DispatchQueue.main.async {
                    completion(model, nil)
                }

            } catch {

                print("❌ JSON Decode Error:", error)
                print("Response Body:", String(data: data, encoding: .utf8) ?? "")

                DispatchQueue.main.async {
                    completion(
                        nil,
                        "Error decoding JSON: \(error)"
                    )
                }
            }

        }.resume()
    }

    /// 创建 URLRequest
    private func createRequest(api: Api) -> URLRequest? {
        var urlString = api.base_url + api.path
        let method = api.method.uppercased()

        // GET 参数
        if method == "GET",
           let parameters = api.parameters,
           !parameters.isEmpty {

            guard var urlComponents = URLComponents(string: urlString) else {
                return nil
            }

            urlComponents.queryItems = parameters.map {
                URLQueryItem(
                    name: $0.key,
                    value: String(describing: $0.value)
                )
            }

            urlString = urlComponents.string ?? urlString
        }

        guard let url = URL(string: urlString) else {
            return nil
        }

        var request = URLRequest(
            url: url,
            cachePolicy: .reloadIgnoringLocalCacheData,
            timeoutInterval: 30
        )

        request.httpMethod = method

        // Header
        if let headers = api.headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }

        // 禁止服务器返回 gzip
        request.setValue("identity", forHTTPHeaderField: "Accept-Encoding")

        // POST Body
        if method == "POST",
           let parameters = api.parameters {

            if api.headers?["Content-Type"] == "application/x-www-form-urlencoded" {

                request.httpBody = parameters.percent_encoded()

            } else {

                do {
                    request.httpBody = try JSONSerialization.data(
                        withJSONObject: parameters
                    )
                } catch {
                    print("❌ Failed to encode parameters as JSON:", error)
                    return nil
                }
            }
        }

        return request
    }
    
}
