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
    let columns: CGFloat = 2.0
    let inset: CGFloat = 6.0
    let spacing: CGFloat = 4.0
    let lineSpacing: CGFloat = 6.0
    var isRandom = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar()
        
        // Refresh Control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(ChefsCollectionViewController.refreshControlDidFire), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }
    
    func refreshControlDidFire() {
        isRandom = true
        collectionView?.reloadData()
        collectionView?.refreshControl?.endRefreshing()
    }
    
    func navigationBar() {
        navigationItem.title = "Chefs"
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName : UIColor.red]
        let attrs = [NSForegroundColorAttributeName: UIColor.red, NSFontAttributeName: UIFont(name: "Helvetica-Bold", size: 24)!]
        
        UINavigationBar.appearance().titleTextAttributes = attrs
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

// MARK: UICollectionViewDelegateFlowLayout
extension ChefsCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = Int((collectionView.frame.width / columns) - (inset + spacing))
        
        return CGSize(width: width, height: width + 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
}


