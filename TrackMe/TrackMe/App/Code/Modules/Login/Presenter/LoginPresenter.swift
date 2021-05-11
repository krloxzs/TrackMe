//
//  LoginPresenter.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation

class LoginPresenter  {
    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
}

extension LoginPresenter: LoginPresenterProtocol {
    func login(with email: String, password: String) {
        view?.showLoader { [weak self] in
            self?.interactor?.login(with: email, password: password)
        }
    }
    
    func registerUser() {
        wireFrame?.registerUser(view: view as Any)
    }

    func updateFormInformation(with email: String, password: String) {
        interactor?.updateFormInformation(with: email, password: password)
    }

    func viewDidLoad() {
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func setScreenAcordingToSession() {
        wireFrame?.setScreenAcordingToSession()
    }
    
    func removeLoader() {
        view?.hiddeLoader { }
    }
    
    func errorInLogin(errorMessage: String) {
        view?.hiddeLoader { [weak self] in
            self?.view?.errorInLogin(errorMessage: errorMessage)
        }
    }
    
    func enableSignUpButton() {
        view?.enableSignUpButton()
    }

    func dissableSignUpButton() {
        view?.dissableSignUpButton()
    }

}
