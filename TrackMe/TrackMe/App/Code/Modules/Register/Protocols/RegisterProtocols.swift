//
//  RegisterProtocols.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//  
//

import Foundation
import UIKit

protocol RegisterViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: RegisterPresenterProtocol? { get set }

    func showLoader(completion: @escaping () -> Void)
    func hiddeLoader(completion: @escaping () -> Void)
    func enableRegisterButton()
    func dissableRegisterButton()
    func errorInRegister(errorMessage: String)
    func registerSuccess()
}

protocol RegisterWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createRegisterModule() -> UIViewController
}

protocol RegisterPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: RegisterViewProtocol? { get set }
    var interactor: RegisterInteractorInputProtocol? { get set }
    var wireFrame: RegisterWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func updateFormInformation(with email: String, password: String, name: String)
    func registerUser(with email: String, password: String, name: String)
}

protocol RegisterInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func enableSignUpButton()
    func dissableSignUpButton()
    func errorInLogin(errorMessage: String)
    func registerSuccess()
}

protocol RegisterInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: RegisterInteractorOutputProtocol? { get set }
    var localDatamanager: RegisterLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: RegisterRemoteDataManagerInputProtocol? { get set }
    func updateFormInformation(with email: String, password: String, name: String)
    func registerUser(with email: String, password: String, name: String)
}

protocol RegisterDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol RegisterRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: RegisterRemoteDataManagerOutputProtocol? { get set }
    func registerUser(with email: String, password: String, name: String)
}

protocol RegisterRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func registerSuccess()
    func errorInLogin(errorMessage: String)
}

protocol RegisterLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
