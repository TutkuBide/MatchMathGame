//
//  firstVC.swift
//  matchGame-App
//
//  Created by Tutku Bide on 6.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit
import Firebase

class homeVC: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        fetchData()
        
    }
    
    func fetchData() {
        let fireStore = Firestore.firestore()
        fireStore.collection("UserInformation").whereField("Username", isEqualTo: Auth.auth().currentUser!.email!).addSnapshotListener { (snapshot, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Error", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        if let highScore = document.get("Highscore") as? Int {
                            self.highScoreLabel.text = "HighScore: \(highScore)"
                            self.usernameLabel.text = Auth.auth().currentUser!.email!
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        performSegue(withIdentifier: "toGameScreen", sender: nil)
    }
    
    @IBAction func leaderBordButton(_ sender: Any) {
        performSegue(withIdentifier: "toLeaderbord", sender: nil)
    }
    
    
}
