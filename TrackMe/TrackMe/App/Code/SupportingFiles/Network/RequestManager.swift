//
//  RequestManager.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//

import Foundation
import NSLogger

enum requestType: String{
    case post = "POST"
    case get = "GET"
}

enum requestUrl: String{
    case baseUrl = "https://trackmeeapp.azurewebsites.net/index.php"
}

typealias Parameters = [String: String]

class RequestManager {
    func makeRequest(parameters: [String: String], requestType: requestType,success: @escaping (Data) -> Void, errorResponse: @escaping (String) -> Void)  {
        guard let url = URL(string: requestUrl.baseUrl.rawValue) else {
            errorResponse("Error in url")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = requestType.rawValue
        let boundary = generateBoundary()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let dataBody = createDataBody(withParameters: parameters, boundary: boundary)
        request.httpBody = dataBody
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                let errorMessage = "DataTask error: " + error.localizedDescription + "\n"
                LoggerManager().logError(domain: Logger.Domain.network,
                                         message: errorMessage)
                errorResponse(errorMessage)
            } else if let data = data,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200 {
                let responseString = String(data: data, encoding: .utf8)
                LoggerManager().logInfo(domain: Logger.Domain.network,
                                        level: Logger.Level.important,
                                        message: responseString ?? "")
                success(data)
            } else {
                let error: String = "Datos no encontrados, por favor revisa la informacion enviada"
                LoggerManager().logError(domain: Logger.Domain.network,
                                         message: error)
                errorResponse(error)
            }
        }.resume()
    }

    func generateBoundary() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }

    func createDataBody(withParameters params: Parameters?, boundary: String) -> Data {
        let lineBreak = "\r\n"
        var body = Data()
        if let parameters = params {
            for (key, value) in parameters {
                body.append("--\(boundary + lineBreak)")
                body.append("Content-Disposition: form-data; name=\"\(key)\"\(lineBreak + lineBreak)")
                body.append("\(value + lineBreak)")
            }
        }
        body.append("--\(boundary)--\(lineBreak)")
        return body
    }

}
