//
//  ChefsCollectionViewController.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/17/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class ChefsCollectionViewController: UICollectionViewController {
    
    let chefsData = Chefs.loadChefs()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = collectionViewLayout as! ChefsCustomViewLayout
        layout.numberOfColumns = 2
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chefsData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChefCell", for: indexPath) as! ChefsCollectionViewCell
        
        // Configure the cell
        let chef = chefsData[indexPath.item]
        cell.chef = chef
        
        return cell
    }
}


