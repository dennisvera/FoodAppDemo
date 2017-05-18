//
//  HomeRecipes.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/18/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class HomeRecipes {
    var recipe: String
    var recipeImage: String
    var chefImage: String

    
    init(recipe: String, recipeImage: String, chefImage: String) {
        self.recipe = recipe
        self.recipeImage = recipeImage
        self.chefImage = chefImage
    }
    
    convenience init(dictionary: NSDictionary) {
        let recipe = dictionary["recipe"] as? String
        let recipeImage = dictionary["recipeImage"] as? String
        let chefImage = dictionary["chefImage"] as? String
        
        self.init(recipe: recipe!, recipeImage: recipeImage!, chefImage: chefImage!)
    }
    
    class func loadRecipes() -> [HomeRecipes] {
        var recipes = [HomeRecipes]()
        if let path = Bundle.main.path(forResource: "HomeRecipes_Data", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    let recipe = HomeRecipes(dictionary: item as! NSDictionary)
                    recipes.append(recipe)
                }
            }
        }
        return recipes
    }
}
