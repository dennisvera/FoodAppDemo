//
//  ViewController.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MasterViewController: UICollectionViewController {
    
    var pageMenu : CAPSPageMenu?
    
    var foodImageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.isToolbarHidden = true
        
        let width = collectionView!.bounds.width - 4.0
        let layout = collectionViewLayout as! StretchyHeaderLayout
        layout.itemSize = CGSize(width: width, height: 62)
        layout.minimumLineSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 2, left: 0, bottom: 2, right: 0)
        layout.maximumStretchHeight = collectionView!.bounds.width
        
        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        var controller : UIViewController = UIViewController(nibName: "controllerNibName", bundle: nil)
        controller.title = "SAMPLE TITLE"
        controllerArray.append(controller)
        
        // Customize page menu to your liking (optional) or use default settings by sending nil for 'options' in the init
        // Example:
        var parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        
        // Initialize page menu with controller array, frame, and optional parameters
//        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), CAPSPageMenuOption: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        
        
        foodImageArray = [#imageLiteral(resourceName: "ceviche1"), #imageLiteral(resourceName: "ceviche2"), #imageLiteral(resourceName: "ceviche3"), #imageLiteral(resourceName: "ceviche1"), #imageLiteral(resourceName: "ceviche2"), #imageLiteral(resourceName: "ceviche3"), #imageLiteral(resourceName: "ceviche1"), #imageLiteral(resourceName: "ceviche2"), #imageLiteral(resourceName: "ceviche3"), #imageLiteral(resourceName: "ceviche1"), #imageLiteral(resourceName: "ceviche2"), #imageLiteral(resourceName: "ceviche3")]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.isNavigationBarHidden = true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}

// MARK: UICollectionViewDataSource
extension MasterViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodImageArray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipesCollectionViewCell
        
        // Configure the cell
//        cell.recipeTitleLabel.text = "Ceviche Mixto"
        cell.dishImageView.image = UIImage(named: "ceviche2")
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RecipeHeader", for: indexPath) as! CollectionHeaderView
        
        return header
    }
    
}


