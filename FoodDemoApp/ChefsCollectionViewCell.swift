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
            if let theChef = chef {
                chefHeadshotImage.image = UIImage(named: theChef.name)
                chefNameLabel.text = theChef.name
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = self.frame.size.width * 0.125
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1.0).cgColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        chefHeadshotImage.image = nil
        chefNameLabel.text = ""
    }
}
