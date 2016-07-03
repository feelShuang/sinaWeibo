//
//  TitleButton.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/7/1.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    // 纯代码创建时调用
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    // 通过xib/storyboard创建时候调用
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
        setupUI()
    }
    
    private func setupUI() {
        
        setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
        sizeToFit()
    }
    
    override func setTitle(title: String?, forState state: UIControlState) {
        super.setTitle((title ?? "") + "  " , forState: state)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
//        titleEdgeInsets = UIEdgeInsets(top: 0, left: (imageView?.frame.size.width)!, bottom: 0, right: (imageView?.frame.size.width)!
//        )
//        imageEdgeInsets = UIEdgeInsets(top: 0, left: (titleLabel?.frame.size.width)!, bottom: 0, right: (titleLabel?.frame.size.width)!)
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.width
    }
}
