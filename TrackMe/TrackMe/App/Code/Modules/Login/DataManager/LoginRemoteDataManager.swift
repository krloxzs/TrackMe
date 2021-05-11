//
//  LoginRemoteDataManager.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation

class LoginRemoteDataManager:LoginRemoteDataManagerInputProtocol {

    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol?
    private var apiDataManager: RequestManager = RequestManager()

    func login(with email: String, password: String) {
        let params:[String : String] = ["service":"GetUser",
                                        "email":"\(email)",
                                        "password":"\(password)"]
        apiDataManager.makeRequest(parameters: params,
                                   requestType: .post) { [weak self] response  in
            guard let self: LoginRemoteDataManager = self,
                  let user: User = try? JSONDecoder().decode(User.self, from: response) else {
                self?.remoteRequestHandler?.errorInLogin(errorMessage: "Json Decode error")
                return
            }
            self.remoteRequestHandler?.loginSuccess(user: user)
        } errorResponse: { errorString in
            self.remoteRequestHandler?.errorInLogin(errorMessage: errorString)
        }
    }
}
