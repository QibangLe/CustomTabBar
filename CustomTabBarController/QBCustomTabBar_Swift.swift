//
//  QBCustomTabBarController.swift
//  CustomTabBarController
//
//  Created by 乐启榜 on 16/7/20.
//  Copyright © 2016年 乐启榜. All rights reserved.
//

import UIKit

class QBCustomTabBar_Swift: UITabBarController {
    
    var button: UIButton?
    let custom_index: NSInteger = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setup(){
        //#Warning
        //TODO: Set Custom_button Image
        //FIXME: You must do it...
        // self.addCenterButton(<#T##image: UIImage##UIImage#>, selectedImage: <#T##UIImage#>)
        
        // 此处更改custom_button 的图片
        self.addCenterButton(UIImage(named: "activity_a_off")!, selectedImage: UIImage(named: "activity_a_on")!)
        
        self.delegate = self
        self.selectedIndex = custom_index
        button?.selected = true
        
    }
    
    func addCenterButton(noramlImage: UIImage, selectedImage: UIImage) {
        
        button = UIButton(type: .Custom)
        // The button's frame equal to button backgroundImage's frame
        button?.frame = CGRect(x: 0, y: 0, width: noramlImage.size.width, height: noramlImage.size.height)
        
        // set button backgroudImage
        button?.setBackgroundImage(noramlImage, forState: .Normal)
        button?.setBackgroundImage(selectedImage, forState: .Selected)
        

        button?.autoresizingMask = [UIViewAutoresizing.FlexibleTopMargin,UIViewAutoresizing.FlexibleLeftMargin,UIViewAutoresizing.FlexibleBottomMargin,UIViewAutoresizing.FlexibleRightMargin]
        
        // 设置button自适应图片的高亮状态
        button?.adjustsImageWhenHighlighted = false
        
        // 添加点击事件
        button?.addTarget(self, action: #selector(buttonClick(_: )), forControlEvents: UIControlEvents.TouchUpInside)
        
        /// 核心代码，设置button的center 和 tabBar的center
        // Import part: Set button's center in tabBar
        let heightDifference: CGFloat = noramlImage.size.height - self.tabBar.frame.size.height;
        
        if heightDifference < 0 {
            button?.center = self.tabBar.center
        } else {
            var center: CGPoint = self.tabBar.center
            center.y = center.y - heightDifference / 2.0
            button?.center = center
        }
        
        self.view.addSubview(button!)
        
    }
    
    func buttonClick(sender: UIButton) {
        //#Warning
        //TODO: Set TabBar Default Index Is 2
        //FIXME: if you alread set default index is 2 in QBRootViewController.swift ,so you must add these two lines of code
        self.selectedIndex = custom_index
        button?.selected = true
        
        // Config Want PresentationController / PushController....

    }
}

extension QBCustomTabBar_Swift: UITabBarControllerDelegate {
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        
        if self.selectedIndex == custom_index {
            
            button?.selected = true
            
        }else {
            
            button?.selected = false
        }
        
    }
}
