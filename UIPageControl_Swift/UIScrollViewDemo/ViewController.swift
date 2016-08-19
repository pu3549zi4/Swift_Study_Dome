//
//  ViewController.swift
//  UIScrollViewDemo
//
//  Created by Sundy on 1/11/15.
//  Copyright (c) 2015 maiziedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet var pageControl1: UIPageControl!
    @IBOutlet var scrollView1: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        scrollView1.backgroundColor = UIColor.redColor()
        scrollView1.contentSize = CGSize(width: 320*4, height: 568)
        //scrollView1.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //scrollView1.contentOffset = CGPoint(x: 10, y: 10)
        scrollView1.indicatorStyle = UIScrollViewIndicatorStyle.White
        
        scrollView1.delegate = self
        
        let aView = UIView(frame: CGRect(x: 0*320, y: 0, width: 320, height: 568))
        aView.backgroundColor = UIColor.yellowColor()
        scrollView1.addSubview(aView)
        
        let bView = UIView(frame: CGRect(x: 1*320, y: 0, width: 320, height: 568))
        bView.backgroundColor = UIColor.greenColor()
        scrollView1.addSubview(bView)
        
        let cView = UIView(frame: CGRect(x: 2*320, y: 0, width: 320, height: 568))
        cView.backgroundColor = UIColor.blueColor()
        scrollView1.addSubview(cView)
        
        pageControl1.addTarget(self, action: "pageChanged", forControlEvents: UIControlEvents.ValueChanged)
        
        
    }
    
    func pageChanged(){
        let curPage = pageControl1.currentPage
        scrollView1.scrollRectToVisible(CGRect(x: curPage*320, y: 0, width: 320, height: 568), animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        //让pageControl跟着变动，要计算当前偏移量
        let curPage = scrollView.contentOffset.x/320
        //pageControl设定当前页
        pageControl1.currentPage = Int(curPage)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

