//
//  PinterestViewController.swift
//  NextCoder088-UICollectionView
//
//  Created by xn011644 on 7/11/16.
//  Copyright © 2016 Next-coder. All rights reserved.
//

import UIKit

class PinterestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, CollectionViewPinterestLayoutDelegate {

    let collectionViewCellIdentifier = "collectionViewCellIdentifier"

    var collectionView: UICollectionView?

    override func loadView() {
        super.loadView()

        let layout = CollectionViewPinterestLayout()
        layout.itemWidth = 120
        layout.itemHeight = 130
        layout.delegate = self
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        self.view.addSubview(collectionView)
        self.collectionView = collectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Simple Demo"

        // register cell class
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewCellIdentifier)

//        // register section header class, can be any class inherent from UICollectionReusableView
//        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: collectionHeaderViewIdentifier)
//
//        // register section footer class, can be any class inherent from UICollectionReusableView
//        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: collectionFooterViewIdentifier)
    }


    // section count in collection
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 1
    }

    // collection cell count in the specific section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 100
    }

    // get collection cell
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionViewCellIdentifier, forIndexPath: indexPath)
        cell.contentView.backgroundColor = UIColor.blueColor()

        var label = cell.viewWithTag(1222) as? UILabel

        if label == nil {

            label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
            label?.tag = 1222
            label?.textColor = UIColor.whiteColor()
            cell.addSubview(label!)

            label!.text = "Cell"
        }
        return cell
    }

    // CollectionViewPinterestLayoutDelegate
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat {

        return CGFloat(indexPath.row * 10 + indexPath.section)
    }

//    // get Supplementary Element
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//
//        if (kind == UICollectionElementKindSectionHeader) {
//
//            // header
//            let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: collectionHeaderViewIdentifier, forIndexPath: indexPath)
//            view.backgroundColor = UIColor.greenColor()
//
//            var label = view.viewWithTag(1221) as? UILabel
//
//            if label == nil {
//
//                label = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
//                label?.tag = 1221
//                label?.textColor = UIColor.whiteColor()
//                view.addSubview(label!)
//
//                label!.text = "section header"
//            }
//
//            return view
//        } else {
//
//            // footer
//            let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: collectionFooterViewIdentifier, forIndexPath: indexPath)
//            view.backgroundColor = UIColor.grayColor()
//
//            var label = view.viewWithTag(1222) as? UILabel
//
//            if label == nil {
//
//                label = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
//                label?.tag = 1222
//                label?.textColor = UIColor.whiteColor()
//                view.addSubview(label!)
//                
//                label!.text = "section footer"
//            }
//            
//            return view
//        }
//    }

}
