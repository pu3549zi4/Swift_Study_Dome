//
//  MyViewController.swift
//  TestAnimation
//
//  Created by Sky Jean on 15/3/24.
//  Copyright (c) 2015年 com.maiziedu. All rights reserved.
//

import UIKit

class MyViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBar.clipsToBounds = true
        
//        var items = self.tabBar.items as! [UITabBarItem]
        let items = self.tabBar.items!
        
        for item in items {
            item.title = nil
            item.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -6, right: 0)
        }
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
      '[UITabBarItem]?' to '[UITabBarItem]' only unwraps optionals; did you mean to use '!'?
    */

}
