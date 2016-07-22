//
//  TestView.swift
//  NextCoder003-View
//
//  Created by xn011644 on 7/18/16.
//  Copyright © 2016 Next-coder. All rights reserved.
//

import UIKit

/*
 
 树状结构：
    UIView---------UIView
            |
            -------UIView-------UIButton
            |                |
            |                ---UILabel
            |
            -------UITextField
 
 实现方式：
    subviews属性包含所有的一级子视图列表
    superview指向父视图
    addSubView()方法增加子视图(还有insertSubview等方法)
    removeFromSuperview()从父视图中移除
    UIWindow是所有视图的根视图

 
    
 */

/*
 
 视图的创建:
    override init(frame: CGRect)
        主要用于代码手动创建视图，可以在此初始化方法中初始化子视图等
 
    required init?(coder aDecoder: NSCoder)
        从nib、storyboard或对象压缩文件中创建UIView对象时使用此方法初始化

    override func awakeFromNib()
        // 从nib、storyboard文件中创建UIView对象时，初始化完成后会调用此方法，可以做一些配置
 
 
 */

/* 
 
 视图手动布局:
    frame
        在父视图的位置和大小，分为origin和size，
        origin就是视图左上角在父视图中的位置
        size是视图的大小(长宽)
    bounds
        视图相对于本身的位置和大小
        origin就是视图在本身中的位置(一般情况都是(0,0))
        size是视图的大小(长宽，一般等于frame.size)
    center
        视图中心点在父视图中的位置
    center/bounds/frame三者任何一个改变，都有可能影响其他两个的值
    层级(zPosition)
        视图的层级是addSubView的顺序有关，后添加的视图在上面，即后来居上。也可以使用insertSubView把子视图插入到指定的层级
    sizeToFit()方法
        让视图的大小自适应内容的大小
    sizeThatFits()方法
        sizeToFit中自适应的方式，子类可以自实现，来计算不同内容下，视图的大小
    layoutSubviews()方法
        此方法中可以重写布局代码，对subViews布局。UIView每次需要布局或重新布局的时候，会调用此方法。此方法由系统根据情况适时调用，开发者不可代码调用。
    setNeedsLayout()方法
        此方法通知View，需要重新布局，View会根据需要调用layoutSubviews()方法。此方法子类不可重写。
    layoutIfNeeded()方法
        此方法强制View重新布局。此方法子类不可重写。
 
 */


/*
 
 基本属性：
    backgroundColor
        背景颜色，整个区块的颜色
    tag
        View标签，一个整数，可以根据此标签在树状结构中找到相应的View
    userInteractionEnabled
        视图是否能够接收触摸事件
 
 */

/*
 
 常用视图:
    UIButton
        按钮。
        封装很多事件(UIControlEvents)，常用的有：.TouchUpInside(点击事件)/.TouchUpOutside(在按钮内按下，手指移动按钮外抬起)/.TouchCancel(取消点击)
        封装UI：1、backgroundImage，背景图片，通过setBackgroundImage(image: UIImage?, forState state: UIControlState)设置不同状态下的背景图
                2、image(icon)，icon图，不同于背景，此图是一个显示在title左边的icon。通过setImage(image: UIImage?, forState state: UIControlState)设置不同状态下的icon
                3、title，标题，通过setTitle(title: String?, forState state: UIControlState) 设置不同状态的标题
                4、titleColor，标题颜色，通过setTitleColor(color: UIColor?, forState state: UIControlState) 这只不同的标题颜色
    
    UITextField
        单行文本框(可编辑)
        与UIButton一样，也封装了很多事件，参见UIControlEvents。这些事件在UITextField上并不常用。
        UITextField也有delegate对象，用于在一定信息变化的情况下，通知外界。具体方法列表，请参考UITextFieldDelegate协议
        封装UI：
            1、font: 字体和字大小 fontColor: 颜色   alignment: 输入排版(居左，居右或居中)
            2、placeholder，用于没输入文本的情况下提示语
            3、背景图background，disabledBackground
            4、其他：leftView/rightView/clearButton/inputView/inputAccessoryView


    UILabel
        不可编辑文本框，单纯显示文本用，可以多行，也可以单行。
        无事件。
        UI主要是font: 字体和字大小 fontColor: 颜色   alignment: 输入排版(居左，居右或居中)   numberOfLines: 1-单行, 0-不限，n-n行
 
    UIImageView
        显示图片的视图，对图片显示进行过优化。
        默认不接收事件。即userInteractionEnabled=false
        定制显示图片：contentMode，值列表请参见UIViewContentMode
        animationImages可以连续以动画形式显示多张图片
 
    UIWindow
        所有视图的根视图，App中至少要有一个Window来显示视图，所有的视图都必须添加到一个Window上才能显示。UIWindow也是UIView的子类，具备UIView所有的功能。同时也实现了一下特殊功能：
        1、UIWindow没有对显示方面做定制
        2、UIWindow定义了一系列方法，可以是window变成KeyWindow，或者显示在屏幕上
        3、UIWindow定义了windowLevel，标识多个window在屏幕上的显示层级
        4、UIWindow提供了rootViewController属性，可以直接显示对应ViewController管理的视图
 
 
 */


class TestView: UIView, UITextFieldDelegate {

    // called by developer
    // 开发者代码中创建UIView对象时使用
    override init(frame: CGRect) {
        super.init(frame: frame)

        print("initWithFrame:")
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = UIColor.brown()
        view.tag = 2332;
        self.addSubview(view)
    }

    // be called when view load from nib/storyboard/archiver
    // 从nib、storyboard或对象压缩文件中创建UIView对象时使用
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        print("initWithCoder:")
    }

    // 从nib、storyboard文件中创建UIView对象时，初始化完成后会调用此方法
    override func awakeFromNib() {
        super.awakeFromNib()

        print("awakeFromNib")
        // self的背景颜色
        self.backgroundColor = UIColor.green()

        // clipsToBounds true标识当前View及所有的subViews，显示的范围是self.bounds，超出这个范围就不显示。 fase
//        self.clipsToBounds = true

        // 新增子视图
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = UIColor.brown()
        view.tag = 2332;
        self.addSubview(view)


        // 添加UIButton
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        button.backgroundColor = UIColor.blue()
        // 设置title
        button.setTitle("Button", for: UIControlState())
        // 设置icon
        button.setImage(UIImage(named: ""), for: UIControlState())
        // 设置背景
        let backgroundImage = UIImage(named: "")?.resizableImage(withCapInsets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2))
        button.setBackgroundImage(backgroundImage,
                                  for: .normal)
        // title字体
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        // title颜色
        button.setTitleColor(UIColor.gray(),
                             for: .normal)
        // 注册事件监听
        button.addTarget(self,
                         action: #selector(buttonTapped(sender:)),
                         for: .touchUpInside)
        self.addSubview(button)

        let textField = UITextField(frame: CGRect(x: 160,
                                                  y: 60,
                                                  width: 100,
                                                  height: 45))
        // 背景图片
        textField.background = UIImage(named: "")?.resizableImage(withCapInsets: UIEdgeInsets(top: 3,
                                                                                              left: 3,
                                                                                              bottom: 3,
                                                                                              right: 3))
        // 设置代理，代理的作用是当TextField的信息发生变化是，通知外界，外界可以根据需要做一些响应
        textField.delegate = self
        // placeholder
        textField.placeholder = "This is a text field"
        // 字体和颜色
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.textColor = UIColor.darkGray()
        // 文本布局
        textField.textAlignment = .center
        self.addSubview(textField)
    }

    override func layoutSubviews() {

        // 更多个性化视图的布局
        super.layoutSubviews()

        // 有些系统版本不支持在layoutSubviews之后改变autolayout

        let view = self.viewWithTag(2332)
        view?.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
//        view?.center = CGPoint(x: 100, y: 100)
//        view?.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)


    }

    @objc func buttonTapped(sender: UIButton) {

        print("buttonTapped \(sender)")
    }

    // 使用UILabel显示单行和多行文本，并设置不同的字体

    // 练习，找一张图片，使用UIImageView显示在当前View上面，并且测试contentMode为不同值时，图片的显示状态

    // 使用UITextFieldDelegate，实现当UITextField文本变化时，在控制台打印出变化的文本
    // 改变UITextField的keyboardType，看看有什么效果


    // 定制一个UIButton，实现点击之后打印“Button Tapped”


    // 在layoutSubviews中，尝试修改一个子视图的位置或大小，看看效果


}
