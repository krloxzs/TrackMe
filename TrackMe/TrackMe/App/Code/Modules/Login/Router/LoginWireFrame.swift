//
//  LoginWireFrame.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation
import UIKit

class LoginWireFrame: LoginWireFrameProtocol {

    class func createLoginModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "LoginView")
        if let view = navController as? LoginView {
            let presenter: LoginPresenterProtocol & LoginInteractorOutputProtocol = LoginPresenter()
            let interactor: LoginInteractorInputProtocol & LoginRemoteDataManagerOutputProtocol = LoginInteractor()
            let localDataManager: LoginLocalDataManagerInputProtocol = LoginLocalDataManager()
            let remoteDataManager: LoginRemoteDataManagerInputProtocol = LoginRemoteDataManager()
            let wireFrame: LoginWireFrameProtocol = LoginWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "LoginStoryboard", bundle: nil)
    }
    
}
