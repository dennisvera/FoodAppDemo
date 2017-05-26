//
//  ChefDetailCollectionHeaderView.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/19/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ChefDetailCollectionHeaderView: UICollectionReusableView {
    @IBOutlet var chefBackgroundImage: UIImageView!
    @IBOutlet var chefNameLabel: UILabel!
    
    @IBOutlet weak var chefBackgroundImageHeightConstraint: NSLayoutConstraint!
    
    var chef: Chefs? {
        didSet {
            if let theRecipe = chef {
                //                dishRecipeImage.image = UIImage(named: theRecipe.recipeImage)
                
                
                chefNameLabel.text = theRecipe.name
            }
        }
    }
    
    var backgroundImageHeight: CGFloat = 0
    var foregroundImageHeight: CGFloat = 0
    var previousHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImageHeight = chefBackgroundImage.bounds.height
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        
        let attributes = layoutAttributes as! ChefDetailStretchyHeaderAttributes
        
        let height = (attributes.frame).height
        if previousHeight != height {
            chefBackgroundImageHeightConstraint.constant = backgroundImageHeight + attributes.deltaY
            previousHeight = height
        }
    }
}
