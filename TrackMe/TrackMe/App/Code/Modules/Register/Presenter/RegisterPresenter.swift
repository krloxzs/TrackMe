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
    func updateFormInformation(with email: String, password: String) {
        interactor?.updateFormInformation(with: email, password: password)
    }
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension RegisterPresenter: RegisterInteractorOutputProtocol {
    func enableSignUpButton() {
        view?.enableRegisterButton()
    }
    
    func dissableSignUpButton() {
        view?.dissableRegisterButton()
    }
    
    // TODO: implement interactor output methods
}
