//
//  ViewController.swift
//  matchGame-App
//
//  Created by Tutku Bide on 3.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit

class signVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    @IBAction func registerButton(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterPage", sender: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "toLoginPage", sender: nil)
    }
    
}

