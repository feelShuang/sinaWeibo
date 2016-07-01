
//
//  UIBarButtonItem+Extension.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/7/1.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    convenience init(imageName: String, target: AnyObject?, action: Selector) {
        
        let btnItem = UIButton()
        btnItem.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btnItem.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btnItem.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        btnItem.sizeToFit()
        
        self.init(customView: btnItem)
    }
}