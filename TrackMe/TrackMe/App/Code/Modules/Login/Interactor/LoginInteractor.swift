//
//  LoginInteractor.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: LoginInteractorOutputProtocol?
    var localDatamanager: LoginLocalDataManagerInputProtocol?
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol?
    private var email: String?

    func updateFormInformation(with email: String, password: String) {
        if self.validateEmail(withEmail: email),
           self.validatePassword(withPassword: password) {
            self.email = email
            presenter?.enableSignUpButton()
        } else {
            presenter?.dissableSignUpButton()
        }
    }

    func login(with email: String, password: String) {
        remoteDatamanager?.login(with: email, password: password)
    }

    private func validateEmail(withEmail email:String) -> Bool {
        if !email.isEmpty, email.isValidEmail() {
            return true
        } else {
            return false
        }
    }

    private func validatePassword(withPassword password:String) -> Bool {
        if !password.isEmpty, password.isValidPassword() {
            return true
        } else {
            return false
        }
    }
    
}

extension LoginInteractor: LoginRemoteDataManagerOutputProtocol {
    func errorInLogin(errorMessage: String) {
        presenter?.errorInLogin(errorMessage: errorMessage)
    }
    
    func loginSuccess(user: User) {
        presenter?.removeLoader()
        localDatamanager?.saveUserInfo(user: user, completion: {
            presenter?.setScreenAcordingToSession()
        })
    }
}
