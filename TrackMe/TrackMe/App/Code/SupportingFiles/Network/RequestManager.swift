//
//  RequestManager.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//

import Foundation


enum requestType: String{
    case post = "POST"
    case get = "GET"
}

enum requestUrl: String{
    case createUser = ""
    case getUser = "s"
}


class RequestManager {
    func makeRequest(parameters: [String: String], requestType: requestType, request: requestUrl, success: @escaping (AnyObject) -> Void, error: @escaping (String) -> Void)  {
        guard let url = URL(string: request.rawValue) else {
            error("Error in url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            error("Error in JSONSerialization")
            return
        }
        request.httpBody = httpBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
