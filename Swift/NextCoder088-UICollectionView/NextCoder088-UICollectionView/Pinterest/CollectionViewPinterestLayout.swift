//
//  CollectionViewPinterestLayout.swift
//  NextCoder088-UICollectionView
//
//  Created by xn011644 on 7/12/16.
//  Copyright © 2016 Next-coder. All rights reserved.
//

import UIKit

@objc protocol CollectionViewPinterestLayoutDelegate {

//    optional func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat

    optional func collectionView(collectionView: UICollectionView, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
}

class CollectionViewPinterestLayout: UICollectionViewLayout {

//    var itemWidth: CGFloat = 0
//    var itemHeight: CGFloat = 80
    var contentSize: CGSize = CGSizeZero

    var defaultItemWidth: CGFloat {

        return self.collectionViewSize.width / 2
    }

    var itemSize: CGSize = CGSizeZero

    // item delegate
    var delegate: CollectionViewPinterestLayoutDelegate? = nil

    var itemsAttributes = [NSIndexPath: UICollectionViewLayoutAttributes]()

    // UICollectionView Size
    var collectionViewSize: CGSize {

        if let collectionView = self.collectionView {

            return collectionView.frame.size
        } else {

            return UIScreen.mainScreen().bounds.size
        }
    }

    func itemSizeAtIndexPath(indexPath: NSIndexPath) -> CGSize {

        guard let collectionView = self.collectionView else { return self.itemSize }

        if let itemSize = self.delegate?.collectionView?(collectionView, sizeForItemAtIndexPath: indexPath) {

            return itemSize
        } else {

            return self.itemSize
        }
    }

    func calculateItemsAttributes() {

        guard let collectionView = self.collectionView else { return }

        let numberOfSections = collectionView.numberOfSections()
        for section in 0..<numberOfSections {

            let numberOfItems = collectionView.numberOfItemsInSection(section)

            // 遍历列，计算列高度
            for itemIndex in 0..<numberOfItems {

                let indexPath = NSIndexPath(forItem: itemIndex, inSection: section)
                let itemAttributes = self.itemAttributesAtIndexPath(indexPath)
                self.itemsAttributes[indexPath] = itemAttributes
            }
        }
    }

    func itemAttributesAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes {

        if let attributes = self.itemsAttributes[indexPath] {

            return attributes
        } else {

            var aboveItemIndexPath: NSIndexPath
            if indexPath.item < self.numberOfColumns {

                if indexPath.section == 0 {

                    let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                    attributes.frame = CGRect(x: CGFloat(indexPath.item) * self.itemWidth,
                                              y: 0,
                                              width: self.itemWidth,
                                              height: self.itemAcurateHeightAtIndexPath(indexPath))
                    return attributes
                } else {

                    aboveItemIndexPath = NSIndexPath(forItem: indexPath.item, inSection: indexPath.section - 1)
                }
            } else {

                aboveItemIndexPath = NSIndexPath(forItem: indexPath.item - self.numberOfColumns, inSection: indexPath.section)
            }
            let aboveItemAttributes = self.itemAttributesAtIndexPath(aboveItemIndexPath)


            let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            attributes.frame = CGRect(x: aboveItemAttributes.frame.origin.x,
                                      y: CGRectGetMaxY(aboveItemAttributes.frame),
                                      width: self.itemWidth,
                                      height: self.itemAcurateHeightAtIndexPath(indexPath))
            return attributes
        }
    }

    override func prepareLayout() {

        self.calculateItemsAttributes()

        guard let collectionView = self.collectionView else { return }

        var lastItemIndexPath: NSIndexPath? = nil

        let numberOfSections = collectionView.numberOfSections()
        var section = numberOfSections - 1
        while section >= 0 {

            let numberOfItems = collectionView.numberOfItemsInSection(section)
            if (numberOfItems > 0) {

                lastItemIndexPath = NSIndexPath(forItem: (numberOfItems - 1) , inSection: section)
                break
            }
            section -= 1
        }

        if let indexPath = lastItemIndexPath {

            if let lastItemAttributes = self.itemsAttributes[indexPath] {

                self.contentSize = CGSize(width: self.collectionWidth,
                                          height: CGRectGetMaxY(lastItemAttributes.frame))
            }
        }
    }

    override func collectionViewContentSize() -> CGSize {

        return self.contentSize
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {

        return Array(self.itemsAttributes.values)
    }

    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {

        return self.itemsAttributes[indexPath]
    }
}
