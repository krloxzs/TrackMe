//
//  RegisterRemoteDataManager.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//  
//

import Foundation

class RegisterRemoteDataManager:RegisterRemoteDataManagerInputProtocol {
    var remoteRequestHandler: RegisterRemoteDataManagerOutputProtocol?
    private var apiDataManager: RequestManager = RequestManager()
    
    func registerUser(with email: String, password: String, name: String) {
        let params:[String : String] = ["service":"CreateUser",
                                        "email": email,
                                        "password": password,
                                        "name": name]
        apiDataManager.makeRequest(parameters: params,
                                   requestType: .post) { [weak self] response  in
            guard let self: RegisterRemoteDataManager = self else {
                self?.remoteRequestHandler?.errorInLogin(errorMessage: "Json Decode error")
                return
            }
            self.remoteRequestHandler?.registerSuccess()
        } errorResponse: { errorString in
            self.remoteRequestHandler?.errorInLogin(errorMessage: errorString)
        }
    }
}
