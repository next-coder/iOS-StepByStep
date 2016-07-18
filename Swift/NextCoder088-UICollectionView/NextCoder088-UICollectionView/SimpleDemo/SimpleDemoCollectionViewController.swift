//
//  SimpleDemoCollectionViewController.swift
//  NextCoder088-UICollectionView
//
//  Created by xn011644 on 7/11/16.
//  Copyright © 2016 Next-coder. All rights reserved.
//

import UIKit

class SimpleDemoCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    let collectionViewCellIdentifier = "collectionViewCellIdentifier"
    let collectionHeaderViewIdentifier = "collectionHeaderViewIdentifier"
    let collectionFooterViewIdentifier = "collectionFooterViewIdentifier"
    var collectionView: UICollectionView?

    override func loadView() {
        super.loadView()

        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
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

        // register section header class, can be any class inherent from UICollectionReusableView
        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: collectionHeaderViewIdentifier)

        // register section footer class, can be any class inherent from UICollectionReusableView
        self.collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: collectionFooterViewIdentifier)
    }


    // section count in collection
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {

        return 10
    }

    // collection cell count in the specific section
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 20
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

    // get Supplementary Element
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {

        print("indexpath : \(indexPath.item), \(indexPath.section)")
        if (kind == UICollectionElementKindSectionHeader) {

            // header
            let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: collectionHeaderViewIdentifier, forIndexPath: indexPath)
            view.backgroundColor = UIColor.greenColor()

            var label = view.viewWithTag(1221) as? UILabel

            if label == nil {

                label = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
                label?.tag = 1221
                label?.textColor = UIColor.whiteColor()
                view.addSubview(label!)

                label!.text = "section header"
            }

            return view
        } else {

            // footer
            let view = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: collectionFooterViewIdentifier, forIndexPath: indexPath)
            view.backgroundColor = UIColor.grayColor()

            var label = view.viewWithTag(1222) as? UILabel

            if label == nil {

                label = UILabel(frame: CGRect(x: 0, y: 0, width: 140, height: 30))
                label?.tag = 1222
                label?.textColor = UIColor.whiteColor()
                view.addSubview(label!)

                label!.text = "section footer"
            }

            return view
        }
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

        return CGSize(width: 50, height: 50)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

        return CGSize(width: self.view.frame.size.width, height: 30)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: self.view.frame.size.width, height: 30)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
