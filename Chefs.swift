//
//  Chefs.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/17/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class Chefs {
    var name: String
    var title: String
    var recipe: String
    
    init(name: String, title: String, recipe: String) {
        self.name = name
        self.title = title
        self.recipe = recipe
    }
    
    convenience init(dictionary: NSDictionary) {
        let name = dictionary["name"] as? String
        let title = dictionary["title"] as? String
        let recipe = dictionary["recipe"] as? String
        
        self.init(name: name!, title: title!, recipe: recipe!)
    }
    
    class func loadChefs() -> [Chefs] {
        var chefs = [Chefs]()
        if let path = Bundle.main.path(forResource: "Chefs_Data", ofType: "plist") {
            if let dictArray = NSArray(contentsOfFile: path) {
                for item in dictArray {
                    let chef = Chefs(dictionary: item as! NSDictionary)
                    chefs.append(chef)
                }
            }
        }
        return chefs
    }
}

