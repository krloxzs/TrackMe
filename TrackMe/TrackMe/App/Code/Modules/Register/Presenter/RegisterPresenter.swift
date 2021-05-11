//
//  RegisterPresenter.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//  
//

import Foundation

class RegisterPresenter  {
    
    // MARK: Properties
    weak var view: RegisterViewProtocol?
    var interactor: RegisterInteractorInputProtocol?
    var wireFrame: RegisterWireFrameProtocol?
    
}

extension RegisterPresenter: RegisterPresenterProtocol {

    func viewDidLoad() {
    }

    func registerUser(with email: String, password: String, name: String) {
        view?.showLoader {
            self.interactor?.registerUser(with: email, password: password, name: name)
        }
    }

    func updateFormInformation(with email: String, password: String, name: String) {
        interactor?.updateFormInformation(with: email, password: password, name: name)
    }
    
}

extension RegisterPresenter: RegisterInteractorOutputProtocol {

    func errorInLogin(errorMessage: String) {
        view?.hiddeLoader { [weak self] in
            self?.view?.errorInRegister(errorMessage: errorMessage)
        }
    }
    
    func enableSignUpButton() {
        view?.enableRegisterButton()
    }
    
    func dissableSignUpButton() {
        view?.dissableRegisterButton()
    }

    func registerSuccess() {
        view?.hiddeLoader { [weak self] in
            self?.view?.registerSuccess()
        }
    }
}
