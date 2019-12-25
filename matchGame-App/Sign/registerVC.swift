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
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func registerButton(_ sender: Any) {
        if mailText.text != "" && passwordText.text == confirmPasswordText.text {
            Auth.auth().createUser(withEmail: mailText.text!, password: passwordText.text!) { (auth, error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "Error")
                }else{
                    //firestore kayıt yükleme
                    let userDictionary = ["user" : self.mailText.text!, "password" : self.passwordText.text!, "highScore" : self.highScore] as [String : Any]
                    let fireStore = Firestore.firestore()
                    fireStore.collection("userInfo").addDocument(data: userDictionary) { (error) in
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
    
}
