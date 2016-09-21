//
//  BaseTableViewController.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/7/1.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

/*
 通知：层级架构较深
 代理：父子，方法较多时使用
 block：父子，方法较少时使用
 */
class BaseTableViewController: UITableViewController {
    
    var isLogin = true
    
    // 访客视图
    var visitorView = VisitorView?()
    
    override func loadView() {
        
        
        // 判断用户是否登录，如果没有登录就显示访客界面，如果已经登录就显示tableView
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    /** 设置未登录界面 */
    private func setupVisitorView() {
        visitorView = VisitorView.visitorView()
        visitorView?.backgroundColor = UIColor(white: 237.0 / 255.0, alpha: 1.0)
        view = visitorView
        
//        visitorView?.delegate = self
        visitorView?.registerButton.addTarget(self, action: #selector(registerBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
        visitorView?.loginButton.addTarget(self, action: #selector(loginBtnClick), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    /** 监听注册按钮 */
    @objc private func registerBtnClick(btn: UIButton) {
        LSPrint("")
    }
    
    /** 登录按钮监听 */
    @objc private func loginBtnClick(btn: UIButton) {
        LSPrint("")
    }
}

/*
extension BaseTableViewController: VisitorViewDelegate {
    
    func visitorViewDidClickRegisterBtn(visitor: VisitorView) {
        LSPrint("")
    }
    
    func visitorViewDidClickLoginBtn(visitor: VisitorView) {
        LSPrint("")
    }
}
*/