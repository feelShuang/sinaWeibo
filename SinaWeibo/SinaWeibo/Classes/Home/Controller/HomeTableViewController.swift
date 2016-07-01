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
        
        // 2.添加导航条按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention", target: self, action: #selector(leftBarButtonItemClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(rightBarButtonItemClick))
    }
    
    @objc func leftBarButtonItemClick() {
        LSLog("")
    }
    
    @objc func rightBarButtonItemClick() {
        LSLog("")
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
