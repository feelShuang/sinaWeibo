//
//  VisitorView.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/7/1.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

/*
protocol VisitorViewDelegate: NSObjectProtocol {
    
    // 默认情况下协议中的方法是必须实现的
    func visitorViewDidClickRegisterBtn(visitor: VisitorView)
    func visitorViewDidClickLoginBtn(visitor: VisitorView)
}
 */

class VisitorView: UIView {
    
    /** 转盘 */
    @IBOutlet weak var rotationImageView: UIImageView!
    /** 图标 */
    @IBOutlet weak var iconImageView: UIImageView!
    /** 文本标签 */
    @IBOutlet weak var titleLabel: UILabel!
    /** 注册按钮 */
    @IBOutlet weak var registerButton: UIButton!
    /** 登录按钮 */
    @IBOutlet weak var loginButton: UIButton!
//    weak var delegate: VisitorViewDelegate?
    
    // MARK: - 外部控制的方法
    /**
     设置访客数据
     
     - parameter imageName: 图标
     - parameter title:     标题
     */
    func setupVisitorInfo(imageName: String?, title: String) {
        
        titleLabel.text = title
        
        guard let name = imageName else {
            // 执行转盘动画
            starAnimation()
            return
        }
        
        rotationImageView.hidden = true
        // 不是首页
        iconImageView.image = UIImage(named: name)
    }
    
    // MARK: - 内部控制的方法
    private func starAnimation() {
        // 创建动画
        let animate = CABasicAnimation(keyPath: "transform.rotation")
        
        // 设置动画属性
        animate.toValue = M_PI
        animate.duration = 8.0
        animate.repeatCount = MAXFLOAT
        
        // 默认情况下只要视图消失，系统会自动移除动画
        animate.removedOnCompletion = false
        
        // 将动画添加到图层上
        rotationImageView.layer.addAnimation(animate, forKey: nil)
    }
    
    class func visitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).last as! VisitorView
    }
    /*
    @IBAction func registerBtnClick(sender: AnyObject) {
        // 和OC不一样的，Swift中如果简单的调用代理方法，不用判断代理是否相应
        delegate?.visitorViewDidClickRegisterBtn(self)
    }
    
    @IBAction func loginBtnClick(sender: AnyObject) {
        
        delegate?.visitorViewDidClickLoginBtn(self)
    }
     */
    
}
