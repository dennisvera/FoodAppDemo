//
//  ChefDetailCollectionViewCell.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/19/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ChefDetailCollectionViewCell: UICollectionViewCell {
    @IBOutlet var dishRecipeImage: UIImageView!
    @IBOutlet var dishNameLabel: UILabel!
    
    var chef: Chefs? {
        didSet {
            
            if let theRecipe = chef {
                dishRecipeImage.image = UIImage(named: theRecipe.name)
                dishNameLabel.text = theRecipe.recipe
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dishRecipeImage.image = nil
        dishNameLabel.text = ""
    }
}
