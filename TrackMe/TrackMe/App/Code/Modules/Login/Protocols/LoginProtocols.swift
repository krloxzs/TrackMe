//
//  LoginProtocols.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation
import UIKit

protocol LoginViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: LoginPresenterProtocol? { get set }
    func showLoader(completion: @escaping () -> Void)
    func hiddeLoader(completion: @escaping () -> Void)
    func enableSignUpButton()
    func dissableSignUpButton()
    func errorInLogin(errorMessage: String)
}

protocol LoginWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createLoginModule() -> UIViewController
    func registerUser(view: Any)
    func setScreenAcordingToSession()
}

protocol LoginPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: LoginViewProtocol? { get set }
    var interactor: LoginInteractorInputProtocol? { get set }
    var wireFrame: LoginWireFrameProtocol? { get set }

    func viewDidLoad()
    func updateFormInformation(with email: String, password: String)
    func login(with email: String, password: String)
    func registerUser()
}

protocol LoginInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func enableSignUpButton()
    func dissableSignUpButton()
    func errorInLogin(errorMessage: String)
    func removeLoader()
    func setScreenAcordingToSession()
}

protocol LoginInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: LoginInteractorOutputProtocol? { get set }
    var localDatamanager: LoginLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol? { get set }
    func updateFormInformation(with email: String, password: String)
    func login(with email: String, password: String)
}

protocol LoginDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol LoginRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: LoginRemoteDataManagerOutputProtocol? { get set }
    func login(with email: String, password: String)
}

protocol LoginRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func loginSuccess(user: User)
    func errorInLogin(errorMessage: String)
}

protocol LoginLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    func saveUserInfo(user: User, completion: () -> Void)
}
