//
//  RegisterView.swift
//  TrackMe
//
//  Created by Carlos Rodriguez on 10/05/21.
//  
//

import Foundation
import UIKit

class RegisterView: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    // MARK: Properties
    var presenter: RegisterPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    private func setUpUI() {
        registerButton.isEnabled = false
        registerButton.setTitle("Registro", for: .normal)
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.backgroundColor = Constants.AppColors.primaryColorMajorelleBlueDisable
        registerButton.layer.cornerRadius = 5
        
        backButton.isEnabled = true
        backButton.setTitle("Atras", for: .normal)
        registerButton.layer.cornerRadius = 5
        
        emailTextfield.addTarget(self, action: #selector(formValidation), for: .editingChanged)
        passwordTextfield.addTarget(self, action: #selector(formValidation), for: .editingChanged)
    }

    @objc func formValidation() {
        presenter?.updateFormInformation(with: self.emailTextfield.text ?? "",
                                         password: self.passwordTextfield.text ?? "",
                                         name: self.nameTextfield.text ?? "")
    }
    
    @IBAction func backButtonPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPress(_ sender: UIButton) {
        guard let email: String = emailTextfield.text,
              let password: String = passwordTextfield.text,
              let name: String = nameTextfield.text else { return }
        view.endEditing(true)
        presenter?.registerUser(with: email, password: password, name: name)
    }
}

extension RegisterView: RegisterViewProtocol {
    func registerSuccess() {
        AlertHelper().showAlert(message: "Registro exitoso") { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }

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
    
    func enableRegisterButton() {
        registerButton.isEnabled = true
        registerButton.backgroundColor = Constants.AppColors.primaryColorVividSkyBlue
    }
    
    func dissableRegisterButton() {
        registerButton.isEnabled = false
        registerButton.backgroundColor = Constants.AppColors.primaryColorMajorelleBlueDisable
    }
    
    func errorInRegister(errorMessage: String) {
        AlertHelper().showError(message: errorMessage)
    }
}

extension RegisterView: UITextFieldDelegate{
//Close text field with return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
