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
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
