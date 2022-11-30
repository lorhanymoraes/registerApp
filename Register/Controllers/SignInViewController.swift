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
    @IBOutlet var btnSignIn: UIButton!
    @IBOutlet var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.signInViewPresenter.delegate = self
        btnSignIn.layer.cornerRadius = 6
        loading.isHidden = true
    }
    
    func alertMessage(type: AlertSignIn) {
        let title: String, message: String
        
        switch type {
        case .noEmail:
            title = "Error"
            message = "Fill with a valid email"
            
        case .noPassword:
            title = "Error"
            message = "Fill in the password field"
            
        case .generalError:
            title = "Warning"
            message = "Wrong data, please, try again"
            
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
        loading.startAnimating()
        let email: String = self.tfEmail.text ?? ""
        let password: String = self.tfPassword.text ?? ""
        signInViewPresenter.signInAuth(email: email, password: password)
        
        if !tfEmail.hasText {
            alertMessage(type: .noEmail)
        }
        
        if !tfPassword.hasText {
            alertMessage(type: .noPassword)
        }
    }
}

extension SignInViewController: SignInViewPresenterDelegate {
    func stopAnimating() {
        loading.stopAnimating()
    }
    
    func showAlert(type: AlertSignIn) {
        alertMessage(type: type)
    }
    
}
