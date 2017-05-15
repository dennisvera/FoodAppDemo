//
//  StretchyHeaderLayout.swift
//  FoodDemoApp
//
//  Created by Dennis Vera on 5/14/17.
//  Copyright © 2017 Dennis Vera. All rights reserved.
//

import UIKit

class StretchyHeaderAttributes: UICollectionViewLayoutAttributes {
    
    var deltaY: CGFloat = 0
    
    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! StretchyHeaderAttributes
        copy.deltaY = deltaY
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? StretchyHeaderAttributes {
            if attributes.deltaY == deltaY {
                return super.isEqual(object)
            }
        }
        return false
    }
}

class StretchyHeaderLayout: UICollectionViewFlowLayout {
    
    var maximumStretchHeight: CGFloat = 0
    
    override class var layoutAttributesClass : AnyClass {
        return StretchyHeaderAttributes.self
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttributes = super.layoutAttributesForElements(in: rect)! as! [StretchyHeaderAttributes]
        let offset = collectionView!.contentOffset
        if (offset.y < 0) {
            let deltaY = fabs(offset.y)
            for attributes in layoutAttributes {
                if let elementKind = attributes.representedElementKind {
                    if elementKind == UICollectionElementKindSectionHeader {
                        var frame = attributes.frame
                        frame.size.height = min(max(0, headerReferenceSize.height + deltaY), maximumStretchHeight)
                        frame.origin.y = frame.minY - deltaY
                        attributes.deltaY = deltaY
                        attributes.frame = frame
                    }
                }
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
