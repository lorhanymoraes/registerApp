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
}

class RegisterViewPresenter {
    
    var delegate: RegisterViewPresenterDelegate?
    var auth: Auth?
    
    
    func registerAuth(email: String, password: String) {
        self.auth = Auth.auth()
        self.auth?.createUser(withEmail: email, password: password, completion: { [self] (result, error) in
            
            if error != nil {
                self.delegate?.showAlert(type: .registerError)
                print("Fail")
            } else {
                print("Sucess")
                self.delegate?.showAlert(type: .sucessRegister)
            }
            
        })
    }
}
