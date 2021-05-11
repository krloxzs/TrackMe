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

    func updateFormInformation(with email: String, password: String) {
        if self.validateEmail(withEmail: email),
           self.validatePassword(withPassword: password) {
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
}

extension RegisterInteractor: RegisterRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
