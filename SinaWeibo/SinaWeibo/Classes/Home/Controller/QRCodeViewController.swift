//
//  QRCodeViewController.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/7/6.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeBtnClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func photoBtnClick(sender: AnyObject) {
    }
    
}
