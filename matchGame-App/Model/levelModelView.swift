extension gameScreenVC {
    
    func getLevels(with level: Int) {
        modelArray.removeAll()
        
        switch level {
        case 1:
            self.createLevel1()
        case 2:
            self.createLevel2()
        case 3:
            self.createLevel3()
        case 4:
            self.createLevel4()
        default:
            self.createLevel1()
        }
    }
    
    func createLevel1()  {
        modelArray.append(gameModel(imageName: "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        modelArray.append(gameModel(imageName: "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        
        
    }
    
    func createLevel2() {
        modelArray.append(gameModel(imageName: "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        modelArray.append(gameModel(imageName: "card4", imageMatched: 4, showCard: false))
        modelArray.append(gameModel(imageName: "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        modelArray.append(gameModel(imageName: "card4", imageMatched: 4, showCard: false))
        
    }
    
    func createLevel3() {
        modelArray.append(gameModel(imageName:  "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        modelArray.append(gameModel(imageName: "card4", imageMatched: 4, showCard: false))
        modelArray.append(gameModel(imageName: "card5", imageMatched: 5, showCard: false))
        modelArray.append(gameModel(imageName: "card6", imageMatched: 6, showCard: false))
        modelArray.append(gameModel(imageName: "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        modelArray.append(gameModel(imageName: "card4", imageMatched: 4, showCard: false))
        modelArray.append(gameModel(imageName: "card5", imageMatched: 5, showCard: false))
        modelArray.append(gameModel(imageName: "card6", imageMatched: 6, showCard: false))
        
    }
    
    func createLevel4() {
        modelArray.append(gameModel(imageName: "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        modelArray.append(gameModel(imageName: "card4", imageMatched: 4, showCard: false))
        modelArray.append(gameModel(imageName: "card5", imageMatched: 5, showCard: false))
        modelArray.append(gameModel(imageName: "card6", imageMatched: 6, showCard: false))
        modelArray.append(gameModel(imageName: "card7", imageMatched: 7, showCard: false))
        modelArray.append(gameModel(imageName: "card8", imageMatched: 8, showCard: false))
        modelArray.append(gameModel(imageName: "card1", imageMatched: 1, showCard: false))
        modelArray.append(gameModel(imageName: "card2", imageMatched: 2, showCard: false))
        modelArray.append(gameModel(imageName: "card3", imageMatched: 3, showCard: false))
        modelArray.append(gameModel(imageName: "card4", imageMatched: 4, showCard: false))
        modelArray.append(gameModel(imageName: "card5", imageMatched: 5, showCard: false))
        modelArray.append(gameModel(imageName: "card6", imageMatched: 6, showCard: false))
        modelArray.append(gameModel(imageName: "card7", imageMatched: 7, showCard: false))
        modelArray.append(gameModel(imageName: "card8", imageMatched: 8, showCard: false))
        
    }
}
