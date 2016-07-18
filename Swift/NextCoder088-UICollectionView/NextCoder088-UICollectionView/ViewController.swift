//
//  ViewController.swift
//  NextCoder088-UICollectionView
//
//  Created by xn011644 on 7/11/16.
//  Copyright © 2016 Next-coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableViewCellIdentifier = "tableViewCellIdentifier"

    var tableView: UITableView?

    override func loadView() {
        super.loadView()

        let tableView = UITableView(frame: self.view.bounds, style: .Plain)
        tableView.dataSource = self
        tableView.delegate = self
        self.view .addSubview(tableView)
        self.tableView = tableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "UICollectionView"

        self.tableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: tableViewCellIdentifier)
    }

    // UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 2
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell: UITableViewCell
        if let cell1 = tableView.dequeueReusableCellWithIdentifier(tableViewCellIdentifier) {

            cell = cell1
        } else {

            cell = UITableViewCell(style: .Default, reuseIdentifier: tableViewCellIdentifier)
        }

        cell.accessoryType = .DisclosureIndicator
        if indexPath.row == 0 {

            cell.textLabel?.text = "SimpleDemoCollectionViewController"
        } else if indexPath.row == 1 {

            cell.textLabel?.text = "PinterestViewController"
        }
        return cell
    }

    // UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        tableView.deselectRowAtIndexPath(indexPath, animated: true)

        if indexPath.row == 0 {

            let simpleDemo = SimpleDemoCollectionViewController(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(simpleDemo, animated: true)
        } else if indexPath.row == 1 {

            let pinterest = PinterestViewController(nibName: nil, bundle: nil)
            self.navigationController?.pushViewController(pinterest, animated: true)
        }
    }


}

