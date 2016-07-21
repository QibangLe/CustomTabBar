//
//  QBRootViewController.swift
//  CustomTabBarController
//
//  Created by 乐启榜 on 16/7/20.
//  Copyright © 2016年 乐启榜. All rights reserved.
//

import UIKit



class QBRootViewController: UIViewController {

    let lunchVC = QBlunchViewController()
 
    lazy var customTabBar: QBCustomTabBar_Swift = {
        let custom_tabBar = QBCustomTabBar_Swift()
        
        let firstVC = QBFirstViewController()
        let secondVC = QBSecondViewController()
        let thirdVC = QBThirdViewController()
        let fourth = QBFourthViewController()
        let fifthVC = QBFifthViewController()
        
        let titles = ["首页","发现","","分析","我的"]
        let vcs: [UIViewController] = [firstVC,secondVC,thirdVC,fourth,fifthVC]
        
        var nvcs: [UINavigationController] = []
        // for 循环设置tabBar
        for (index, vc) in vcs.enumerate() {

            let nvc = UINavigationController(rootViewController: vc)
            nvc.tabBarItem.title = titles[index]
            
            // 设置tabBar选中时字体的颜色
            nvc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.orangeColor(),NSFontAttributeName: UIFont.systemFontOfSize(11.0)], forState: .Selected)
            // 设置tabBar正常情况下的字体颜色
            nvc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor(),NSFontAttributeName: UIFont.systemFontOfSize(11.0)], forState: .Normal)
            // 设置文字向上偏移5个像素
            nvc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -5)

            nvcs.append(nvc)
        }
        
        custom_tabBar.viewControllers = nvcs
        
        //#warning 
        //TODO: Set TabBar Default Index Is 2
        //FIXME:You Can Set CustomTabBar's Default Index In Here, And Must Add Two Lines Code In QBCustomTabBar_Swift.swift
        
        /*
         这里设置默认选择下标为2，即第3个页面
         custom_tabBar.selectedIndex = 2
         
         同时在QBCustomTabBarController中，setup方法设置
         self.selectedIndex = custom_index
         button?.selected = true
         
         如果不设置默认下标，可以注释这三行代码
        */
        custom_tabBar.selectedIndex = 2
        
        return custom_tabBar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // add LunchVCH
        self.addChildVC(self.lunchVC)
        
        // Animations: lunchVC To customTabBar(customTabBar is equal to mainVC)
        // If you don't need lunchVC, you can delete code, and keep this code 'self.addChildVC(self.customTabBar)'
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (__int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            
            UIView.beginAnimations("LunchVCToMainVC", context: nil)
            UIView.setAnimationDuration(1.0)
            UIView.setAnimationCurve(UIViewAnimationCurve.EaseIn)
            UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: self.view, cache: true)
            self.removeChildVC(self.lunchVC)
            self.addChildVC(self.customTabBar)
            UIView.commitAnimations()
        };
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension QBRootViewController {
    
    func addChildVC(viewController: UIViewController) {
        
        self.addChildViewController(viewController)
        self.view.addSubview(viewController.view)
        viewController.didMoveToParentViewController(self)
        
    }
    
    func removeChildVC(viewController: UIViewController){
        
        viewController.view.removeFromSuperview()
        viewController.willMoveToParentViewController(nil)
        viewController.removeFromParentViewController()
        
    }
}
