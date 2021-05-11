//
//  RegisterInteractor.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//  
//

import Foundation

class RegisterInteractor: RegisterInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: RegisterInteractorOutputProtocol?
    var localDatamanager: RegisterLocalDataManagerInputProtocol?
    var remoteDatamanager: RegisterRemoteDataManagerInputProtocol?

    func updateFormInformation(with email: String, password: String, name: String) {
        if self.validateEmail(withEmail: email),
           self.validatePassword(withPassword: password),
           !name.isEmpty {
            presenter?.enableSignUpButton()
        } else {
            presenter?.dissableSignUpButton()
        }
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

    func registerUser(with email: String, password: String, name: String) {
        remoteDatamanager?.registerUser(with: email, password: password, name: name)
    }
    
}

extension RegisterInteractor: RegisterRemoteDataManagerOutputProtocol {
    func registerSuccess() {
        presenter?.registerSuccess()
    }
    
    func errorInLogin(errorMessage: String) {
        presenter?.errorInLogin(errorMessage: errorMessage)
    }
    
    // TODO: Implement use case methods
}
