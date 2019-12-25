//
//  registerVC.swift
//  matchGame-App
//
//  Created by Tutku Bide on 3.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class registerVC: UIViewController {
    @IBOutlet weak var mailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var backLogin: UIButton!
    
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerButton.layer.cornerRadius = 25
        registerButton.clipsToBounds = true
        backLogin.layer.cornerRadius = 25
        backLogin.clipsToBounds = true
        
        
    }
    
    
    @IBAction func registerButton(_ sender: Any) {
        if mailText.text != "" && passwordText.text == confirmPasswordText.text {
            Auth.auth().createUser(withEmail: mailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    
                    let userDictionary = ["Username" : self.mailText.text!, "Password" : self.passwordText.text!, "Highscore" : self.highScore] as [String : Any]
                    let fireStore = Firestore.firestore()
                    fireStore.collection("UserInformation").addDocument(data: userDictionary) { (error) in
                        if error != nil {
                            self.makeAlert(title: "Error", message: error!.localizedDescription)
                        }
                    }
                    self.performSegue(withIdentifier: "fromRegisterToGame", sender: nil)
                }
            }
        }else{
            self.makeAlert(title: "error", message: "hata")
        }
        
    }
    
    @IBAction func backLogin(_ sender: Any) {
        
        performSegue(withIdentifier: "toLogin", sender: nil)
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
