//
//  HomeCollectionViewCell.swift
//  FoodDemoApp
//
//  Created by Flatiron School on 5/17/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var recipeTitleLabel: UILabel!
    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var chefImage: UIImageView!
    
    var recipe: HomeRecipes? {
        didSet {
            chefImage.layer.cornerRadius = chefImage.frame.size.width/2
            chefImage.layer.borderWidth = 3
            chefImage.layer.borderColor = UIColor.white.cgColor
            chefImage.clipsToBounds = true
            
            if let theRecipe = recipe {
                recipeTitleLabel.text = theRecipe.recipe
                dishImageView.image = UIImage(named: theRecipe.recipeImage)
                chefImage.image = UIImage(named: theRecipe.chefImage)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        recipeTitleLabel.text = ""
        dishImageView.image = nil
        chefImage.image = nil
    }
}
