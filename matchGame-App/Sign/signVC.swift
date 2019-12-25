//
//  ViewController.swift
//  matchGame-App
//
//  Created by Tutku Bide on 3.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit

class signVC: UIViewController {
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 25
        registerButton.clipsToBounds = true
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
    }
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterPage", sender: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "toLoginPage", sender: nil)
    }
    
}

