//
//  ChefsCollectionViewCell.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/17/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ChefsCollectionViewCell: UICollectionViewCell {
    @IBOutlet var chefHeadshotImage: UIImageView!
    @IBOutlet var chefNameLabel: UILabel!
    
    var chef: Chefs? {
        didSet {
            chefHeadshotImage.layer.cornerRadius = chefHeadshotImage.frame.size.width/2
            chefHeadshotImage.clipsToBounds = true
            
            if let theChef = chef {
                chefHeadshotImage.image = UIImage(named: theChef.name)
                chefNameLabel.text = theChef.name
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        chefHeadshotImage.image = nil
        chefNameLabel.text = ""
    }
}
