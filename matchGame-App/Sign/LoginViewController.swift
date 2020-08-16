//
//  loginVC.swift
//  matchGame-App
//
//  Created by Tutku Bide on 6.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 25
        loginButton.clipsToBounds = true
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        if mailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: mailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    self.performSegue(withIdentifier: "fromLoginToGame", sender: nil)
                }
            }
            
        }else{
            makeAlert(title: "Error", message: "Kullanıcı adı veya Parola yanlış")
        }
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
