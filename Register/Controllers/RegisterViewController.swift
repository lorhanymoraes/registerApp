//
//  RegisterViewController.swift
//  Register
//
//  Created by Lorhany Moraes on 21/11/22.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    var auth: Auth?
    var registerViewPresenter = RegisterViewPresenter()
    
    @IBOutlet var tfName: UITextField!
    @IBOutlet var tfBusinessName: UITextField!
    @IBOutlet var tfPhone: UITextField!
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.registerViewPresenter.delegate = self
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
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedRegisterBtn(_ sender: UIButton) {
        
        let email = tfEmail.text ?? ""
        let password = tfPassword.text ?? ""
        registerViewPresenter.registerAuth(email: email, password: password)
        
    }
}

extension RegisterViewController: RegisterViewPresenterDelegate {
    func showAlert(type: AlertRegister) {
        alertMessage(type: type)
    }
    
}
