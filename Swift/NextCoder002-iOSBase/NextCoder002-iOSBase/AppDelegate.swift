//
//  AppDelegate.swift
//  NextCoder002-iOSBase
//
//  Created by xn011644 on 7/15/16.
//  Copyright © 2016 Next-coder. All rights reserved.
//

import UIKit


/*

 此类事程序的主入口，由@UIApplicationMain标识
 继承自UIResponder
 同时必须实现UIApplicationDelegate协议

 UIApplicationDelegate包含很多方法，其中最终要的一个是
 optional public func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool

 1、这个方法是程序的入口，App启动的时候，系统首先加载资源文件，并在屏幕上显示配置好的默认图片。
 2、 加载完成资源文件之后，会创建AppDelegate实例(系统自动创建)，并调用一系列的方法。
 3、在调用的方法中，就包含上面这个方法，标识系统已经完全准备好启动App了。
 4、接下来，在此方法中，开发者负责初始化window，及子视图等，用于显示自定义的UI。
 5、也可以包含一定的业务逻辑处理。
 6、由于在此方法执行完成之后，系统才会渲染界面。故此方法中不适合处理过多或过于耗时的逻辑，增加应用启动时间。
 */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    // 以下方法都是UIApplicationDelegate中的方法
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        // 当使用代码来实现UI的时候，必须在此处初始化window和各个ViewController

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()

        print("application:didFinishLaunchingWithOptions:")

        return true
    }

    // 此方法标识应用不在活跃，比如系统弹出重要提示时，当前应用就会失去焦点
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.

        print("applicationWillResignActive:")
    }

    // 此方法标识应用进入后台运行，比如切换到其他应用，用户按Home键回到桌面等
    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

        print("applicationDidEnterBackground:")
    }

    // 此方法标识应用进入后台运行后，被重新打开
    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        print("applicationWillEnterForeground:")
    }

    // 此方法标识应用重新进入活跃
    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        print("applicationDidBecomeActive:")
    }

    // 当应该被关闭时(进程杀掉)调用
    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        print("applicationWillTerminate:")
    }
    
    
}

