//
//  CAAnimateViewController.swift
//  TestAnimation
//
//  Created by Sky Jean on 15/4/9.
//  Copyright (c) 2015年 com.maiziedu. All rights reserved.
//

import UIKit

class CAAnimateViewController: UIViewController {
    
    var myLayer : CALayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        self.testLayerProperty()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    //MARK: 操作部分
    @IBAction func startClicked(sender: AnyObject) {
//        self.caBasicAnimate()
//        self.implicitAnimate()
//        self.keyFrameAnimate()
//        self.testLayerProperty()
//        self.implicitAnimation()
        self.newBasicAnimate()
//        self.newKeyFrameAnimate()
    }

    @IBAction func fallbackClicked(sender: AnyObject) {
        let subsArray = self.view.subviews as NSArray
        for view in subsArray {
            if view.isKindOfClass(UIImageView) {
                view.removeFromSuperview()
            }
        }
    }

    @IBAction func stopClicked(sender: AnyObject) {
    }

    //MARK: 动画方法部分
    func caBasicAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRectMake(150, 200, 100, 100)
        self.view.addSubview(imgView)
        
        let la = imgView.layer
        
        let scaleAni = CABasicAnimation(keyPath: "transform.scale")
        scaleAni.fromValue = 1.0
        scaleAni.toValue = 1.2
        scaleAni.autoreverses = true
        scaleAni.fillMode = kCAFillModeForwards
        scaleAni.repeatCount = MAXFLOAT
        scaleAni.duration = 1.0
        
        let opacityAni = CABasicAnimation(keyPath: "opacity")
        opacityAni.fromValue = 0.3
        opacityAni.toValue = 1.0
        opacityAni.fillMode = kCAFillModeForwards
        opacityAni.duration = 1.0
        opacityAni.autoreverses = true
        opacityAni.repeatCount = MAXFLOAT
        
        la.addAnimation(scaleAni, forKey: "group")
        la.addAnimation(opacityAni, forKey: "opa")
    }
    
    func newBasicAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRectMake(150, 200, 100, 100)
        self.view.addSubview(imgView)
        
        //1,选定角色CALayer
        let layer = imgView.layer
        
        //2,写第一个剧本变形CAAnimation
        let scaleAnimate = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimate.fromValue = 1.0
        scaleAnimate.toValue = 1.5
        scaleAnimate.autoreverses = true
        scaleAnimate.repeatCount = MAXFLOAT
        scaleAnimate.duration = 2.0
        
        //3,写第二个剧本用来透明
        let opaqueAnimate = CABasicAnimation(keyPath: "opacity")
        opaqueAnimate.fromValue = 0.0
        opaqueAnimate.toValue = 1.0
        opaqueAnimate.autoreverses = true
        opaqueAnimate.repeatCount = MAXFLOAT
        opaqueAnimate.duration = 2.0
        
        //4,把剧本交给演员开始动画
        layer.addAnimation(scaleAnimate, forKey: "scaleAnimate")
        layer.addAnimation(opaqueAnimate, forKey: "opaqueAnimate")
        
    }
    
    func implicitAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRectMake(150, 200, 100, 100)
        self.view.addSubview(imgView)
        imgView.alpha = 0.3

        UIView.animateWithDuration(1, delay: 0, options: [UIViewAnimationOptions.Repeat, UIViewAnimationOptions.Autoreverse], animations: { () -> Void in
            imgView.frame = CGRectMake(140, 190, 120, 120)
            imgView.alpha = 1.0
        }) { (finished) -> Void in
            print("finished")
        }
    }
    
    func keyFrameAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRectMake(200, 200, 40, 40)
        self.view.addSubview(imgView)
        
        let la = imgView.layer
        
        let keyAni = CAKeyframeAnimation(keyPath: "position")
        //values
        let value0 = NSValue(CGPoint: la.frame.origin)
        let value1 = NSValue(CGPoint: CGPointMake(la.frame.origin.x, la.frame.origin.y + 100))
        let value2 = NSValue(CGPoint: CGPointMake(la.frame.origin.x - 150, la.frame.origin.y + 100))
        let value3 = NSValue(CGPoint: CGPointMake(la.frame.origin.x - 150, la.frame.origin.y))
        let value4 = NSValue(CGPoint: la.frame.origin)
        keyAni.values = [value0, value1, value2, value3, value4]
        
        //frame Times
//        keyAni.keyTimes = [0.0, 0.6, 0.7, 0.8, 0.5]
        
//        var timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
//        keyAni.timingFunctions = [timingFunction, timingFunction, timingFunction, timingFunction, timingFunction]
        
        keyAni.repeatCount = 100
        keyAni.autoreverses = false
        keyAni.calculationMode = kCAAnimationLinear
        keyAni.duration = 3
        
        let scaleAni = CABasicAnimation(keyPath: "transform.scale.y")
        scaleAni.fromValue = 1.0
        scaleAni.toValue = 0.1
        scaleAni.autoreverses = true
        scaleAni.fillMode = kCAFillModeForwards
        scaleAni.repeatCount = MAXFLOAT
        scaleAni.duration = 0.2
        
//        la.addAnimation(scaleAni, forKey: "scale")
        la.addAnimation(keyAni, forKey: "keyAni")
    }
    
    func newKeyFrameAnimate() {
        let imgView = UIImageView(image: UIImage(named: "maiziLogo")!)
        imgView.frame = CGRectMake(150, 200, 40, 40)
        self.view.addSubview(imgView)
        
        //1,选定角色CALayer
        let layer = imgView.layer
        
        //2,写剧本
        let keyAnimate = CAKeyframeAnimation(keyPath: "position")
        //3,设定关键帧
        let value0 = NSValue(CGPoint: layer.position)
        let value1 = NSValue(CGPoint: CGPointMake(layer.position.x, layer.position.y + 200))
        let value2 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y + 200))
        let value3 = NSValue(CGPoint: CGPointMake(layer.position.x - 150, layer.position.y))
        let value4 = NSValue(CGPoint: layer.position)
        keyAnimate.values = [value0, value1, value2, value3, value4]
        
        keyAnimate.keyTimes = [0.0, 0.5, 0.6, 0.7, 1]
        
        let tf0 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        let tf1 = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        let tf2 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        let tf3 = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        keyAnimate.timingFunctions = [tf0, tf1, tf2, tf3]
        
        keyAnimate.autoreverses = false
        keyAnimate.repeatCount = MAXFLOAT
        keyAnimate.duration = 6.0
        
        //4，start
        layer.addAnimation(keyAnimate, forKey: "keyAnimate")
    }
    
    func testLayerProperty() {
        myLayer = CALayer()
        myLayer.backgroundColor = UIColor.magentaColor().CGColor
        myLayer.borderColor = UIColor.orangeColor().CGColor
        myLayer.borderWidth = 5.0
        myLayer.cornerRadius = 10.0
        myLayer.shadowColor = UIColor.whiteColor().CGColor
        myLayer.shadowOffset = CGSizeMake(5.0, 5.0)
        myLayer.shadowOpacity = 0.2
        myLayer.frame = CGRectMake(100, 100, 100, 100)
        
        self.view.layer.addSublayer(myLayer)
    }
    
    func implicitAnimation() {
        myLayer.position.y += 300
    }
}
