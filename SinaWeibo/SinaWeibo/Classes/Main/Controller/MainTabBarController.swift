//
//  MainTabBarController.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/6/30.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // iOS7以后只需要设置tintColor,那么图片和文字都会按照tintColor渲染
        tabBar.tintColor = UIColor.orangeColor()
        
        // 添加所有的子控制器
        addChildViewControllers();
    }
    
    // MARK: - 添加所有的子控制器
    func addChildViewControllers(){
    
        // 首页
        addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
        // 首页
        addChildViewController("HomeTableViewController", title: "消息", imageName: "tabbar_message_center")
        // 首页
            addChildViewController("HomeTableViewController", title: "发现", imageName: "tabbar_discover")
        // 首页
        addChildViewController("HomeTableViewController", title: "我", imageName: "tabbar_profile")
    }
    
    // MARK: - 添加一个子控制器
    func addChildViewController(childControllerName: String, title: String, imageName: String) {
        /*
        guard 条件判断 else {
            只有条件为假才会执行{}
            return;
        }
         guard可以有效解决可选绑定容易形成{}的嵌套
         */
        
        guard let name = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as? String else {
            LSLog("获取命名空间失败")
            return
        }
        let cls: AnyClass? = NSClassFromString(name + "." + childControllerName)
        
        guard let typeCls = cls as? UITableViewController.Type else {
            LSLog("cls不能当做UITableViewController")
            return
        }
        let childController = typeCls.init()
        
        // 设置子控制器的属性
        childController.tabBarItem.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "_hightlighted")
        
        addChildViewController(childController)
    }
}
