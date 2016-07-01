//
//  UIButton+Extension.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/7/1.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

extension UIButton {
    
    /*
     如果构造方法前面没有convenience单词，代表着是一个初始化构造方法（指定构造方法）
     如果构造方法前面有convenience单词，代表着是一个便利构造方法
     指定构造方法和便利构造方法的区别
     指定构造方法中必须对所有属性初始化
     便利构造方法中不用对所有的属性进行初始化，以为便利构造方法依赖于指定构造方法
     一般情况下如果想给系统提供一个快速创建的方法，就自定义一个便利构造方法
    */
    convenience init(imageNamed: String, backgroundImageNamed: String) {
        
        self.init()
        // 设置前景图片
        setImage(UIImage(named: imageNamed), forState: UIControlState.Normal)
        setImage(UIImage(named: imageNamed + "_highlighted"), forState: UIControlState.Highlighted)
        // 设置背景图片
        setBackgroundImage(UIImage(named: backgroundImageNamed), forState: UIControlState.Normal)
        setBackgroundImage(UIImage(named: backgroundImageNamed + "_highlighted"), forState: UIControlState.Highlighted)
        // 调整图片大小
        sizeToFit()
    }
}