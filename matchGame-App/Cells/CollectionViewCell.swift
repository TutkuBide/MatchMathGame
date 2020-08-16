//
//  CollectionViewCell.swift
//  matchGame-App
//
//  Created by Tutku Bide on 6.12.2019.
//  Copyright © 2019 Tutku Bide. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    

    func configure(model: GameModel) {
        backView.isHidden = model.showCard
        imageView.image = UIImage(named: model.imageName)
    }
}
