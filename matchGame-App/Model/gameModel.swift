//
//  model.swift
//  matchGame-App
//
//  Created by Tutku Bide on 6.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import Foundation
struct gameModel {
    
    var imageName: String
    var imageMatched: Int
    var showCard: Bool
    
    init(imageName:String, imageMatched: Int, showCard: Bool) {
        self.imageName = imageName
        self.imageMatched = imageMatched
        self.showCard = showCard
    }
}
