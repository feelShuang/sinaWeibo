//
//  QRCodeViewController.swift
//  SinaWeibo
//
//  Created by LiuShuang on 16/7/6.
//  Copyright © 2016年 LiuShuang. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeViewController: UIViewController {
    
    // 自定义tabBar
    @IBOutlet weak var customTabBar: UITabBar!
    // 扫描容器高度约束
    @IBOutlet weak var containerHeightContraint: NSLayoutConstraint!
    // 冲击波top约束
    @IBOutlet weak var scanlineTopConstraint: NSLayoutConstraint!
    // 冲击波视图
    @IBOutlet weak var scanLineView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1. 设置默认选中第一个item
        customTabBar.selectedItem = customTabBar.items![0]
        customTabBar.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // 1. 开启冲击波动画
        startAnimation()
        
        // 2. 开始扫描
        starScan()
    }
    
    private func startAnimation() {
        
        // 设置冲击波top约束
        self.scanlineTopConstraint.constant = -containerHeightContraint.constant
        // 强制更新
        self.scanLineView.layoutIfNeeded()
        
        // 执行冲击波动画
        [UIView .animateWithDuration(2.0, animations: {
            // 修改约束
            self.scanlineTopConstraint.constant = self.containerHeightContraint.constant
            UIView.setAnimationRepeatCount(MAXFLOAT)
            // 强制更新
            self.scanLineView.layoutIfNeeded()
        })];
    }
    
    private func starScan()  {
        // 1. 判断是否能够将输入设备添加到会话中
        if !session.canAddInput(deviceInput) {
            return
        }
        // 2. 判断是否能够将输出设备添加到会话中
        if !session.canAddOutput(output) {
            return
        }
        // 3. 将输入和输出设备添加到会话中
        session.addInput(deviceInput)
        session.addOutput(output)
        // 4. 设置输出能够解析的数据类型
        // 注意：设置能够解析的数据类型，一定要在输出对象添加到会话之后设置，否则会报错
        output.metadataObjectTypes = output.availableMetadataObjectTypes
        // 5. 设置输出对象的代理，只要解析成功就会通知代理
        output.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        // 添加预览图层
        view.layer.insertSublayer(previewLayer, atIndex: 0)
        // 6. 告诉session开始扫描
        session.startRunning()
    }
 
    @IBAction func closeBtnClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func photoBtnClick(sender: AnyObject) {
    }
    
    // MARK: - 懒加载
    // 会话
    private lazy var session: AVCaptureSession = AVCaptureSession()
    
    // 输入设备
    private lazy var deviceInput: AVCaptureDeviceInput? = {
        // 获取摄像头
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do {
            // 创建输入对象
            let input = try AVCaptureDeviceInput(device: device)
            return input
        } catch {
            LSPrint(error)
            return nil
        }
    }()
    
    // 输出设备
    private lazy var output: AVCaptureMetadataOutput = AVCaptureMetadataOutput()
    // 创建预览图层
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
       
        let layer = AVCaptureVideoPreviewLayer(session: self.session)
        layer.frame = UIScreen.mainScreen().bounds
        return layer
    }()
    
    // 创建用于绘制边线的图层
    private lazy var 
}

// MARK: - TabBarDelegate
extension QRCodeViewController : UITabBarDelegate {
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        // 1. 修改容器高度
        if item.tag == 1 {
            LSPrint("二维码")
            self.containerHeightContraint.constant = 200
        } else {
            LSPrint("条形码")
            self.containerHeightContraint.constant = 120
        }
        // 2. 停止动画
        self.scanLineView.layer.removeAllAnimations()
        // 3. 重新开启动画
        startAnimation()
    }
}

// MARK: - AVCaptureMetadataOutputObjectsDelegate
extension QRCodeViewController : AVCaptureMetadataOutputObjectsDelegate {
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        LSPrint(metadataObjects.last?.stringValue)
        // 2. 获取扫描到的二维码的位置
        for object in metadataObjects {
            // 2.1 判断当前获取到的数据，是否是机器可识别的类型
            if object is AVMetadataMachineReadableCodeObject {
                // 2.2 转换
                let codeObject = previewLayer.transformedMetadataObjectForMetadataObject(object as! AVMetadataObject) as! AVMetadataMachineReadableCodeObject
                LSPrint(codeObject)
                // 2.3 绘制图形
                drawCorners(codeObject)
            }
        }
    }
    
    func drawCorners(codeObject: AVMetadataMachineReadableCodeObject) {
    
    }
}
