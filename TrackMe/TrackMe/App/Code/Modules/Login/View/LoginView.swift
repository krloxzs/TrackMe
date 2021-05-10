//
//  LoginView.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation
import UIKit

class LoginView: UIViewController {

    // MARK: Properties
    var presenter: LoginPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension LoginView: LoginViewProtocol {
    // TODO: implement view output methods
}
