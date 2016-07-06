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
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBar.addSubview(composeButton)
        
        // 保存按钮尺寸
        let rect = composeButton.frame
        let width = tabBar.bounds.width / CGFloat(childViewControllers.count)
        // 设置按钮位置
        composeButton.frame = CGRect(x: 2 * width, y: 0, width: width, height: rect.height)
    }
    
    /*
     public: 最大权限，可以再当前framework中和其他framework中随意访问
     private: 私有权限，只能在当前文件中访问
     internal: 默认的权限，可以再当前framework中随意访问
    */
    // MARK: - 添加所有的子控制器
    private func addChildViewControllers(){
        /*
        // 首页
        addChildViewController("HomeTableViewController", title: "首页", imageName: "tabbar_home")
        // 消息
        addChildViewController("HomeTableViewController", title: "消息", imageName: "tabbar_message_center")
        // 发现
            addChildViewController("HomeTableViewController", title: "发现", imageName: "tabbar_discover")
        // 我
        addChildViewController("HomeTableViewController", title: "我", imageName: "tabbar_profile")
         */
        
        // 1.1 读取JSON数据
        guard let filePath = NSBundle.mainBundle().pathForResource("MainVCSettings", ofType: "json") else {
            return
        }
        // 1.2 将JSON数据转换为对象
        guard let data = NSData(contentsOfFile: filePath) else {
            return
        }
        // Swift和OC不太一样，OC中一般情况如果发生错误会给传入的指针赋值，而在Swift中使用的是异常处理机制
        // 以后单反看到thows的方法，那么就必须进行try处理，而只要看到try,就需要协商do{} catch{}
        // 只有do中的代码发生错误，才会执行catch{}中的代码
        // try  正常处理异常，也就是通过do catch来处理
        // try! 告诉系统一定不会有异常，也就是可以不通过do catch来处理，开发中不建议这样写，一旦发生就会崩溃
        // try? 告诉系统可能有错也可能没错，如果没有系统自动将结果包装成一个可选类型给我们，如果有错系统会返回nil,如果使用try? 那么可以不通过do catch来处理
        do {
            let objc = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableLeaves) as! [[String: AnyObject]]
            // 1.3 遍历字典
            for dict in objc {
                
                let vcName = dict["vcName"] as? String
                let title = dict["title"] as? String
                let imageName = dict["imageName"] as? String
                addChildViewController(vcName, title: title, imageName: imageName)
            }
            
        } catch {
            
        }
    }
    
    // MARK: - 添加一个子控制器
    private func addChildViewController(childControllerName: String?, title: String?, imageName: String?) {
        /*
         guard 在函数内部使用
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
        
        var cls: AnyClass? = nil
        if let vcName = childControllerName {
            cls = NSClassFromString(name + "." + vcName)
        }
        
        guard let typeCls = cls as? UITableViewController.Type else {
            LSLog("cls不能当做UITableViewController")
            return
        }
        let childController = typeCls.init()
        // 设置子控制器的属性
        childController.title = title
        if let imgName = imageName {
            
            childController.tabBarItem.image = UIImage(named: imgName)
            childController.tabBarItem.selectedImage = UIImage(named: imgName + "_hightlighted")
        }
        
        let navController = UINavigationController(rootViewController: childController)
        addChildViewController(navController)
    }
    
    /*
     如果给按钮的监听方法加上private就会报错，报错原因是因为监听事件是由运行循环触发的，而如果该方法是私有的只能在当前类中访问
     OC中是没有问题的，因为OC是动态派发的
     而Swift中素有东西都是在编译时确定的
    */
    func composeBtnClik(btn: UIButton) {
        LSLog(btn)
    }
    
    // MARK: - 懒加载
    private lazy var composeButton: UIButton = {
        ()-> UIButton
        in
        let btn = UIButton(imageNamed: "tabbar_compose_icon_add", backgroundImageNamed: "tabbar_compose_button")
        
        btn.addTarget(self, action: #selector(composeBtnClik), forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
}
