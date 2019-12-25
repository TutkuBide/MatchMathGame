//
//  leaderBoardVC.swift
//  matchGame-App
//
//  Created by Tutku Bide on 6.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit
import Firebase

class leaderBoardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var usernameArray = [String]()
    var highScoreArray = [Int]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usernameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaderBoardTableViewCell
        cell.highScoreLabel.text = "Score: \(highScoreArray[indexPath.row])"
        cell.usernameLabel.text = usernameArray[indexPath.row]
        return cell
    }
    
    func getData() {
        let fireStore = Firestore.firestore()
        fireStore.collection("UserInformation").addSnapshotListener { (snapshot, error) in
            if error != nil {
                //
            }else{
                if snapshot?.isEmpty != nil && snapshot != nil {
                    for document in snapshot!.documents {
                        if let userName = document.get("Username") as? String {
                            if let highScore = document.get("Highscore") as? Int {
                                
                                self.usernameArray.append(userName)
                                self.highScoreArray.append(highScore)
                            }
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    
    
    
}
