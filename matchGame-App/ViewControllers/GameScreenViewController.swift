//
//  gameScreenVC.swift
//  matchGame-App
//
//  Created by Tutku Bide on 6.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit
import Firebase

class GameScreenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var collectionVC: UICollectionView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var timer = Timer()
    var timeCounter = 0
    var modelArray = [GameModel]()
    var selectCounter = 0
    var selectIndexPath = 0
    var levelCounter = 1
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionVC.delegate = self
        collectionVC.dataSource = self
        scoreLabel.text = "Score: 0"
        timeCounter = 150
        timeLabel.text = "Time: \(timeCounter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameScreenViewController.timerFunction), userInfo: nil, repeats: true)
        getScore()
        self.getLevels(with: 1)
        self.collectionVC.reloadData()
        modelArray.shuffle()
    }
    
    @objc func timerFunction() {
        timeCounter = timeCounter - 1
        timeLabel.text = "Time: \(timeCounter)"
        if timeCounter == 0 {
            timer.invalidate()
            let alert = UIAlertController(title: "Uyarı", message: "Süre Doldu", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "TAMAM", style: UIAlertAction.Style.default) { (UIAlertAction) in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(okButton)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func timesUp() {
        if timeCounter > highScore {
            let fireStore = Firestore.firestore()
            fireStore.collection("UserInformation").whereField("Username", isEqualTo: Auth.auth().currentUser!.email!).addSnapshotListener { (snapshot, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Error", preferredStyle: UIAlertController.Style.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    if snapshot?.isEmpty != true && snapshot != nil {
                        for document in snapshot!.documents {
                            let documentID = document.documentID
                            fireStore.collection("UserInformation").document(documentID).setData(["Highscore" : self.timeCounter], merge: true) { (error) in
                                if error != nil {
                                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription ?? "Error", preferredStyle: UIAlertController.Style.alert)
                                    let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                                    alert.addAction(okButton)
                                    self.present(alert, animated: true, completion: nil)
                                } else {
                                    self.navigationController?.popViewController(animated: true)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    func levelUpdate() {
        modelArray.removeAll()
        if levelCounter == 2 {
            self.levelLabel.text = "Level 2"
            self.getLevels(with: 2)
        } else if levelCounter == 3 {
            self.levelLabel.text = "Level 3"
            self.getLevels(with: 3)
        } else if levelCounter == 4 {
            self.levelLabel.text = "Level 4"
            self.getLevels(with: 4)
        }
        modelArray.shuffle()
        self.collectionVC.reloadData()
    }
    
    func levelFinished() {
        var iscompleted = 0
        for i in 0..<modelArray.count {
            if modelArray[i].showCard == true {
                iscompleted = iscompleted + 1
            }
        }
        if iscompleted == modelArray.count {
            self.levelCounter = levelCounter + 1
            levelUpdate()
            if levelCounter == 5 {
                timer.invalidate()
                self.scoreLabel.text = "Score: \(timeCounter)"
                let alert = UIAlertController(title: "Tebrikler", message: "Score: \(timeCounter)", preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    self.navigationController?.popViewController(animated: true)
                }
                timesUp()
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            }
        }
    }

    func getScore() {
        let fireStore = Firestore.firestore()
        fireStore.collection("UserInformation").whereField("Username", isEqualTo: Auth.auth().currentUser!.email!).addSnapshotListener { (snapshot, error) in
            if error != nil {
            } else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        if let highScore = document.get("Highscore") as? Int {
                            self.highScore = highScore
                        }
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionVC.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.configure(model: modelArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        modelArray[indexPath.row].showCard = true
        collectionVC.reloadData()
        selectCounter = selectCounter + 1
        if selectCounter == 1 {
            selectIndexPath = indexPath.row
        } else if selectCounter == 2 {
            if modelArray[indexPath.row].imageMatched != modelArray[selectIndexPath].imageMatched {
                self.collectionVC.isUserInteractionEnabled = false
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                    self.modelArray[indexPath.row].showCard = false
                    self.modelArray[self.selectIndexPath].showCard = false
                    self.collectionVC.isUserInteractionEnabled = true
                    self.collectionVC.reloadData()
                }
            }
            selectCounter = 0
        }
        levelFinished()
    }
}
