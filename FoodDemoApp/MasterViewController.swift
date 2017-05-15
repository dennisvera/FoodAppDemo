//
//  ViewController.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class MasterViewController: UICollectionViewController {
    
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
        cell.recipeTitleLabel.text = "Ceviche Mixto"
        cell.dishImageView.image = foodImageArray[indexPath.row]
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RecipeHeader", for: indexPath) as! CollectionHeaderView
        
        return header
    }
    
}


