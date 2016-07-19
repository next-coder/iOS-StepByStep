//
//  ViewController.swift
//  NextCoder002-iOSBase
//
//  Created by xn011644 on 7/15/16.
//  Copyright © 2016 Next-coder. All rights reserved.
//

import UIKit

/* ViewController是视图控制器，MVC中的Controller层
    主要作用是
    1、管理视图(管理结构、布局等)
    2、管理数据(获取视图需要显示的数据，管理数据显示)
    3、连接View和Model层

 */

/*
    
 ViewController重点学习：
 1、生命周期函数
 2、管理视图和数据
 3、presenting view controller
 4、parent-child ViewController
 5、UINavigationController、UITabBarController
 
 */

class ViewController: UIViewController {

    // 初始化
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {

        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func loadView() {

        super.loadView()

        // 加载视图，开发者可以在这里创建个性化的视图
        // 如果self.view为空，则第一次使用self.view的时候触发调用此方法
        // super中的方法，默认创建一个UIView给self.view
        // 如果要在此方法中使用self.view，则必须先调用super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 这里是加载完视图后，立即调用的方法，即紧接着loadView后调用
        // 可以在此方法中实现更多配置，比如UITableView的delegate, dataSource，子视图的布局等等
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 视图即将显示的时候调用(调用时，视图还未显示)
        // 此方法在每次视图显示的时候都会调用
        // 可以实现每次显示都需要更新视图或数据
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // 视图完成显示时调用(调用时，视图已经显示)
        // 此方法在每次视图显示的时候都会调用
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // 视图即将从屏幕上消失时调用(调用时，视图还未消失)
        // 此方法在每次视图消失的时候都会调用
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        // 视图即将从屏幕上消失时调用(调用时，视图已经消失)
        // 此方法在每次视图消失的时候都会调用
    }

    // 此方法已经废弃，视图被移除ViewController时调用
//    override func viewDidUnload() {
//
//
//    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        // 即将调用self.view的layout的时候
        // 可以做一些配置工作
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        // 已经完成Layout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

