//
//  RegisterViewPresenter.swift
//  Register
//
//  Created by Lorhany Moraes on 21/11/22.
//

import Foundation
import FirebaseAuth

protocol RegisterViewPresenterDelegate {
    func showAlert (type: AlertRegister)
    func stopAnimating()
}

class RegisterViewPresenter {
    
    
    var delegate: RegisterViewPresenterDelegate?
    var auth: Auth?
    
    func validateEmail (email: String)-> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}"
        let validateRegex = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return validateRegex.evaluate(with: email)
    }
    
    func registerAuth(email: String, password: String) {
        self.auth = Auth.auth()
        self.auth?.createUser(withEmail: email, password: password, completion: { [self] (result, error) in
            
            if error != nil {
                self.delegate?.showAlert(type: .registerError)
                self.delegate?.stopAnimating()
                print("Fail")
            } else {
                print("Sucess")
                self.delegate?.showAlert(type: .sucessRegister)
                self.delegate?.stopAnimating()
            }
            
        })
    }
}
