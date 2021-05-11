//
//  LoginView.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 09/05/21.
//  
//

import Foundation
import UIKit
import SPAlert

class LoginView: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    // MARK: Properties
    var presenter: LoginPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    private func setUpUI() {
        loginButton.isEnabled = false
        loginButton.setTitle("Iniciar sesion", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = Constants.AppColors.primaryColorMajorelleBlueDisable
        loginButton.layer.cornerRadius = 5
        registerButton.isEnabled = true
        registerButton.setTitle("Registro", for: .normal)
        registerButton.layer.cornerRadius = 5
        emailTextfield.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        passwordTextfield.addTarget(self, action: #selector(formValidation), for: .editingChanged)
    }
    
    
    @IBAction func loginButtonPress(_ sender: UIButton) {
        guard let email: String = emailTextfield.text,
              let password: String = passwordTextfield.text else { return }
        view.endEditing(true)
        presenter?.login(with: email, password: password)
    }
    
    @IBAction func RegisterButtonPress(_ sender: UIButton) {
        presenter?.registerUser()
    }

    @objc func formValidation() {
        presenter?.updateFormInformation(with: self.emailTextfield.text ?? "",
                                         password: self.passwordTextfield.text ?? "")
    }
    
}

extension LoginView: LoginViewProtocol {
    func showLoader(completion: @escaping () -> Void) {
        LoaderHelper().showLoader(view: self) {
             completion()
        }
    }
    
    func hiddeLoader(completion: @escaping () -> Void) {
        LoaderHelper().hideLoader(view: self) {
            completion()
        }
    }
    
    func errorInLogin(errorMessage: String) {
        AlertHelper().showError(message: errorMessage)
    }
    
    func enableSignUpButton() {
        loginButton.isEnabled = true
        loginButton.backgroundColor = Constants.AppColors.primaryColorVividSkyBlue
    }
    
    func dissableSignUpButton() {
        loginButton.isEnabled = false
        loginButton.backgroundColor = Constants.AppColors.primaryColorMajorelleBlueDisable
    }
}

extension LoginView: UITextFieldDelegate{
//Close text field with return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
