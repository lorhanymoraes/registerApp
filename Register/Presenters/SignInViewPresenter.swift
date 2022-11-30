//
//  SignInViewPresenter.swift
//  Register
//
//  Created by Lorhany Moraes on 21/11/22.
//

import Foundation
import FirebaseAuth

protocol SignInViewPresenterDelegate {
    func showAlert (type: AlertSignIn)
    func stopAnimating()
}

class SignInViewPresenter {
    
    var delegate: SignInViewPresenterDelegate?
    var auth: Auth?
    
    func signInAuth(email: String, password: String) {
        self.auth = Auth.auth()
        self.auth?.signIn(withEmail: email, password: password, completion: { (usuario, error) in
            
            if error != nil {
                print("Wrong data, try again")
                self.delegate?.showAlert(type: .generalError)
                self.delegate?.stopAnimating()
                } else {
                    print("Sucess login")
                    self.delegate?.showAlert(type: .successLogin)
                    self.delegate?.stopAnimating()
                }
        })
        
    }
}
