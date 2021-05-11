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
        registerButton.setTitle("Iniciar sesion", for: .normal)
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
                                         password: self.passwordTextfield.text ?? "")
    }
    
    @IBAction func backButtonPress(_ sender: Any) {
    
    }
    
    @IBAction func registerButtonPress(_ sender: UIButton) {
    
    }
}

extension RegisterView: RegisterViewProtocol {
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
        //        mostrar alerta
    }
    
    // TODO: implement view output methods
}

extension RegisterView: UITextFieldDelegate{
//Close text field with return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
