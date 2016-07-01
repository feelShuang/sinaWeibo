//
//  MineTableViewController.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/6/30.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

class MineTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.判断用户是否登录
        if !isLogin {
            visitorView?.setupVisitorInfo("visitordiscover_image_profile", title: "登陆后，你的微博、相册、个人资料会显示在这里，展示给他人")
            return
        }
    }
}

// MARK: - Table view data source
extension MineTableViewController {

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}