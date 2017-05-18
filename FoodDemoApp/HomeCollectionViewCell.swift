//
//  HomeCollectionViewCell.swift
//  FoodDemoApp
//
//  Created by Flatiron School on 5/17/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var recipeTitleLabel: UILabel!
    
    var chef: Chefs? {
        didSet {
            dishImageView.layer.cornerRadius = dishImageView.frame.size.width/2
            dishImageView.clipsToBounds = true
            
            if let theChef = chef {
                dishImageView.image = UIImage(named: theChef.name)
                recipeTitleLabel.text = theChef.recipe
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dishImageView.image = nil
        recipeTitleLabel.text = ""
    }
}
