//
//  SignInViewController.swift
//  Register
//
//  Created by Lorhany Moraes on 21/11/22.
//

import UIKit
import FirebaseAuth

class SignInViewController: UIViewController {
    
    var signInViewPresenter = SignInViewPresenter()
    
    @IBOutlet var tfEmail: UITextField!
    @IBOutlet var tfPassword: UITextField!
    
    var auth: Auth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInViewPresenter.delegate = self
        self.auth = Auth.auth()
    }
    
    func alertMessage(type: AlertSignIn) {
        let title: String, message: String
        
        switch type {
        case .wrongData:
            title = "Error"
            message = "Wrong data, please, try again"
            
        case .generalError:
            title = "Warning"
            message = "We have a unexpected problem, try again or reload page"
            
        case .successLogin:
            title = "Welcome"
            message = "Successful login"
        }
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func tappedSignInButton(_ sender: Any) {
        
        let email: String = self.tfEmail.text ?? ""
        let password: String = self.tfPassword.text ?? ""
        signInViewPresenter.signInAuth(email: email, password: password)
        
    }
}

extension SignInViewController: SignInViewPresenterDelegate {
    func showAlert(type: AlertSignIn) {
        alertMessage(type: type)
    }
    
}
