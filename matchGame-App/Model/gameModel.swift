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
    var imageID: Int
    var status: Bool
    
    init(imageName:String, imageID: Int, status: Bool) {
        self.imageName = imageName
        self.imageID = imageID
        self.status = status
    }
}
