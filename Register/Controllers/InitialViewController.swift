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
    
    @IBOutlet var ivCircles: [UIView]!
    override func viewDidLoad() {
        super.viewDidLoad()
        configButtons()
    }
    
    func configButtons() {
        btSignIn.clipsToBounds = true
        btSignIn.layer.cornerRadius = 8
        btSignIn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        btRegister.clipsToBounds = true
        btRegister.layer.cornerRadius = 8
        btRegister.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        ivCircles.forEach { button in
            button.layer.cornerRadius = button.frame.size.height/2
        }
    }
    
}

