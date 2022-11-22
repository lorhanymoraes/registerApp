//
//  InitialViewController.swift
//  Register
//
//  Created by Lorhany Moraes on 21/11/22.
//

import UIKit
import Foundation

class InitialViewController: UIViewController {
    
    @IBOutlet var btSignIn: UIButton!
    @IBOutlet var btRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtons()
    }
    
    func configButtons() {
        btSignIn.layer.cornerRadius = 8
        btRegister.layer.cornerRadius = 8
    }
    
}

