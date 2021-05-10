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

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
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
extension LoginView: UITextFieldDelegate{
//Close text field with return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
