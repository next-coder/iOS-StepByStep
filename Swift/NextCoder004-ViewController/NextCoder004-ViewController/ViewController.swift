//
//  ViewController.swift
//  NextCoder002-iOSBase
//
//  Created by xn011644 on 7/18/16.
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

/*
 
 生命周期函数：
    1、 init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) 和 init?(coder aDecoder: NSCoder)
    2、 func awakeFromNib()，当ViewController从Nib或Storyboard中加载时，调用初始化方法之后，会调用此方法
    3、func loadView()，当ViewController是代码创建时，调用此方法加载视图
    4、func viewDidLoad()，当视图加载完成后，调用此方法
    5、func viewWillAppear(_ animated: Bool)，当视图即将显示到屏幕上时，调用此方法
    6、func viewDidAppear(_ animated: Bool)，当视图已经显示到屏幕上后，调用此方法
    7、func viewWillDisappear(_ animated: Bool)，当视图即将从屏幕上消失时，调用此方法
    8、func viewDidDisappear(_ animated: Bool)，当视图已经从屏幕上消失时，调用此方法
 
 */

/*
 
 管理视图和数据
    1、开发者可以在awakeFromNib或loadView中创建更多更丰富的视图
    2、可以在viewDidLoad中，对视图做更多的配置
    3、可以在viewWillAppear、viewDidAppear、viewWillDisappear或viewDidDisappear中，根据需要，对视图进行更新
    4、开发者可以在ViewController中保存需要显示的数据，在适当的时候把数据显示到对应的视图中
    5、开发者可以在ViewController中对数据进行格式化处理，是数据能够更精确的展示给用户
    6、可以在ViewController中校验用户输入数据，使用户输入更准确
 
 */

/*
 
 presenting view controller：
    iOS中，展示新页面主要有两种方式，一种是从下往上推入，一种是从右往左推入。前面一种就是这里要介绍的presenting，后面一种是之后要介绍的UINavigationController的功能。
    1、func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Swift.Void)? = nil)，此方法是从当前的ViewController present一个新的ViewController
    2、func dismiss(animated flag: Bool, completion: (() -> Swift.Void)? = nil)，此方法是让当前ViewController消失，同时展示上一个ViewController
    3、var presentedViewController: UIViewController? { get }，此属性标识当前ViewController present了其他ViewController
    4、presentingViewController: UIViewController? { get }，此属性标识当前ViewController 被其他ViewController present出来了
 
 
 */

/*
 
 parent-child ViewController：
    parent-child主要是让单个ViewController的代码量减少，方便管理代码。比如说，有一个ViewController，管理了一个非常复杂的页面，为了防止ViewController代码过长，我们可以把页面分成不同的区块，每个区块一个ViewController，通过parent-child把所有的区块展示到同一个ViewController中，这样每个ViewController代码量都比较少，代码清晰，方便管理。

    parent-child实现方式如下：
    1、把child的View通过parent.view.addSubview()，添加到parent的视图树中
    2、把child通过parent.addChildViewController()，添加到parent的结构中
    3、根据需要，通过View的布局属性，布局child.view在parent.view中的位置和大小
 

 */

/*
 
 UINavigationController、UITabBarController
    之前介绍了一种从一个ViewController切换到另一个的present方式。现在介绍另外两种方式：
    1、UINavigationController，一种侧滑推入的方式。默认通过从右往左侧滑推入的方式显示新的ViewController。Navigation主要的学习点：
        1）UINavigationController本身的特性，UINavigationControllerDelegate中方法的作用
        2）UINavigationBar、UINavigationItem和UIBarButtonItem
        3）UIViewController对UINavigationController的支持
 
 
    2、UITabBarController
        1）UITabBarController本身，UITabBarControllerDelegate
        2）UITabBar和UITabBarItem
        3）UIViewController对UITabBarController的支持
    
    3、UINavigationController和UITabBarController的配合使用
 */

/*
 
 1、UINavigationController和UINavigationControllerDelegate
    UINavigationController主要是实现一种从右往左侧滑展示新的ViewController，同时原来屏幕上显示的ViewController消失。其中有一些重要的属性和方法：
        1）UINavigationController本身是一个ViewController，其中包含了一个navigationBar，就是平时App状态栏下面的那一条，通常navigationBar还包含返回按钮和右侧其他操作按钮。
        2）UINavigationController的View本身是一种两层结构的视图，第一层是UINavigationController.view，第二层是navigationBar和下面的内容ViewController.view，第二层是第一层的子View。
        3）public init(rootViewController: UIViewController)通过第一个需要显示的ViewController初始化UINavigationController。需要显示UINavigationController时，其默认内容View显示rootViewController.view
        4）public func pushViewController(_ viewController: UIViewController, animated: Bool)推入一个新的ViewController，并显示出来
        5）public func popViewController(animated: Bool) -> UIViewController? 将最上面的ViewController弹出(返回按钮就是实现此功能)。弹出还有其他两个方法，请参见UINavigationController文档介绍
        6）var viewControllers: [UIViewController] 所有已经推入的ViewController列表，每推入一个，viewControllers就会增加一个，每弹出一个，viewControllers就会减少一个。此属性可以修改，通过静默的方法改变弹出的顺序
        7）var navigationBar: UINavigationBar { get } 获取包含的navigationBar
    UINavigationControllerDelegate中包含一系列UINavigationController状态变化时的回调方法。程序可以通过实现此协议，并注册成为UINavigationController.delegate来监听这些变化。

 2、UINavigationBar、UINavigationItem和UIBarButtonItem
    UINavigationBar是UINavigationController显示中顶部的横条，其主要是管理UINavigationItem。
    UINavigationItem是一个不可见组件，主要作用是管理UIBarButtonItem。每个ViewController都有自己的UINavigationItem，当ViewController被推入是，其UINavigationItem也被推入到UINavigationBar中，从而UINavigationItem中的UIBarButtonItem就会显示在UINavigationBar上。
    UIBarButtonItem是UINavigationBar上的各个按钮，主要包含返回按钮和用户定制的行为按钮等。
    
    1）UINavigationBar中，最重要的就是- (void)setBackgroundImage:(nullable UIImage *)backgroundImage forBarPosition:(UIBarPosition)barPosition barMetrics:(UIBarMetrics)barMetrics，用于定制UINavigationBar的背景
    2）UINavigationItem是一个功能比较多的组件：
        a）public init(title: String) 以title初始化，title是导航栏中间显示的文字，title也可以通过title属性修改
        b）public var titleView: UIView? 如果不想在标题的位置显示单纯文字，则可以通过此属性定制标题视图
        c）public var backBarButtonItem: UIBarButtonItem? 定制化的返回按钮
        d）var leftBarButtonItems: [UIBarButtonItem]? 导航栏左侧按钮列表，导航栏左右两侧都可以显示多个按钮，如果需要展示多个，则使用此属性即可实现。如果只显示一个按钮，也可以使用var leftBarButtonItem: UIBarButtonItem? 属性
        e）var rightBarButtonItems: [UIBarButtonItem]? 导航栏右侧按钮列表，如果只需要显示一个，则也可以使用var rightBarButtonItem: UIBarButtonItem? 属性
 
    3）UIBarButtonItem主要功能有以下几点：
        a）以文字标题初始化init(title: String?, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector?)，此种方式显示只用文字的按钮
        b）以图片标题初始化init(image: UIImage?, landscapeImagePhone: UIImage?, style: UIBarButtonItemStyle, target: AnyObject?, action: Selector?) 此种方式在按钮上显示一个icon
        c）以系统提供的标注Item类型初始化init(barButtonSystemItem systemItem: UIBarButtonSystemItem, target: AnyObject?, action: Selector?) 会显示系统定制类型的样式
        d）以自定义样式的视图初始化init(customView: UIView) 此种方式，可以随意定义样式
        e）func setBackgroundImage(_ backgroundImage: UIImage?, for state: UIControlState, barMetrics: UIBarMetrics) 可以通过此方法改变背景

 3、UIViewController对UINavigationController的支持
    1）UIViewController中有navigationController属性，指向当前ViewController对应的UINavigationController
    2）UIViewController中有navigationItem属性，可以针对当前ViewController的业务，定制导航栏中的按钮和标题等
 */

/*
 
 UITabBarController与UINavigationController类似，
 
 
 
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

        // 当ViewController从Nib或Storyboard中加载时，调用此方法
    }

    override func loadView() {

        super.loadView()

        // 加载视图，开发者可以在这里创建个性化的视图
        // 如果self.view为空，则第一次使用self.view的时候触发调用此方法
        // super中的方法，默认创建一个UIView给self.view
        // 如果要在此方法中使用self.view，则必须先调用super.loadView()

        // 注意：当ViewController从Nib或Storyboard中加载时，此方法不会被调用
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

    // 此方法已经废弃，View视图被移除ViewController时调用
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

    // 内存不足时，会收到此警告(系统调用此方法)
    // 开发者可以在此方法中释放不用的内存，或者释放之后可以重新加载的信息
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    
}

