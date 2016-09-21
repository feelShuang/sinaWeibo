//
//  HomeTableViewController.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/6/30.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.判断用户是否登录
        if !isLogin {
            visitorView?.setupVisitorInfo(nil, title: "关注一些人，看看有什么惊喜")
            return
        }
        
        // 2.初始化导航条
        setupNav()
    }
    
    private func setupNav() {
        
        // 2.1 添加leftBarButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(leftBarButtonItemClick))
        // 2.2 添加rightBarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(rightBarButtonItemClick))
        // 2.3 添加title
        let titleBtn = TitleButton()
        titleBtn.setTitle("feelShuang", forState: UIControlState.Normal)
        titleBtn.addTarget(self, action: #selector(titleViewClick), forControlEvents: UIControlEvents.TouchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    @objc func leftBarButtonItemClick() {
        LSPrint("")
    }
    
    @objc func rightBarButtonItemClick() {
        // 1. 通过storyboard创建控制器
        let qrSB = UIStoryboard(name: "QRcode", bundle: nil)
        let qrVC = qrSB.instantiateInitialViewController()!
        // 2. 推出控制器
        presentViewController(qrVC, animated: true, completion: nil)
    }
    
    @objc func titleViewClick(btn: UIButton) {
        btn.selected = !btn.selected
    }
}

// MARK: - Table view data source
extension HomeTableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
