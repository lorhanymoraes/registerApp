//
//  RegisterViewController.swift
//  Register
//
//  Created by Lorhany Moraes on 21/11/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var registerViewPresenter = RegisterViewPresenter()
    
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfBusinessName: UITextField!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    @IBOutlet var btnSignIn2: UIButton!
    @IBOutlet var loading: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerViewPresenter.delegate = self
        btnSignIn2.layer.cornerRadius = 6
        loading.isHidden = true
    }
    
    func alertMessage(type: AlertRegister) {
        let title: String, message: String
        
        switch type {
        case .sucessRegister:
            title = "Success"
            message = "Account created"
            
        case .registerError:
            title = "Warning"
            message = "Failed to register"
        case .noName:
            title = "Warning"
            message = "Fill in the name field"
        case .noBusinessName:
            title = "Warning"
            message = "Fill in the business name field"
        case .noPhone:
            title = "Warning"
            message = "Fill in the phone field"
        case .noEmail:
            title = "Warning"
            message = "Fill in the email field"
        case .noPassword:
            title = "Warning"
            message = "Fill in the password field"
        case .wrongEmail:
            title = "Warning"
            message = "Email field must have the following format: example@emailadress.com"
        case .wrongPassword:
            title = "Warning"
            message = "Password must contain at least 6 characters"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedRegisterBtn(_ sender: Any) {
        loading.startAnimating()
        loading.isHidden = false
        let email = tfEmail.text ?? ""
        let password = tfPassword.text ?? ""
        registerViewPresenter.registerAuth(email: email, password: password)
        
        if !tfName.hasText {
            alertMessage(type: .noName)
        }
        if !tfBusinessName.hasText {
            alertMessage(type: .noBusinessName)
        }
        if !tfPhone.hasText {
            alertMessage(type: .noPhone)
        }
        if !tfEmail.hasText {
            alertMessage(type: .noEmail)
        }
        
        if !registerViewPresenter.validateEmail(email: tfEmail.text ?? "") {
            alertMessage(type: .wrongEmail)
        }
        
        if !tfPassword.hasText {
            alertMessage(type: .noPassword)
        }
        if tfPassword.text?.count ?? 0 < 6 {
            alertMessage(type: .wrongPassword)
        }
    }
}

extension RegisterViewController: RegisterViewPresenterDelegate {
    
    func stopAnimating() {
        loading.stopAnimating()
        loading.isHidden = true
    }
    
    
    func showAlert(type: AlertRegister) {
        alertMessage(type: type)
    }
    
}
