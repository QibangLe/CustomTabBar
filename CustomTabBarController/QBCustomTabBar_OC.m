//
//  QBCustomTabBar_OC.m
//  CustomTabBarController
//
//  Created by 乐启榜 on 16/7/21.
//  Copyright © 2016年 乐启榜. All rights reserved.
//

#import "QBCustomTabBar_OC.h"

#define kQBCustom_Index 2

@interface QBCustomTabBar_OC ()<UITabBarControllerDelegate>

@end

@implementation QBCustomTabBar_OC
{
    UIButton *button;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self stude];
    
    
    
}
- (void)stude
{
    [self addCenterButtonWithImage:[UIImage imageNamed:@"activity_a_off"] withSelectedImage:[UIImage imageNamed:@"activity_a_on"]];
    self.delegate = self;
    self.selectedIndex = kQBCustom_Index;
    button.selected = YES;
    
}

- (void)addCenterButtonWithImage:(UIImage *)normalImage withSelectedImage:(UIImage *)selectedImage
{
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    button.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    
    //设定button大小为适应图片
    button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    [button setBackgroundImage:selectedImage forState:UIControlStateSelected];
    //去掉选中button时候的阴影
    button.adjustsImageWhenHighlighted = NO;
    /**
     *  核心代码：设置button的centter 和tabBar的center
     */
    CGFloat heightDifference = normalImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0 ) {
        button.center = self.tabBar.center;
    }
    else
    {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference / 2.0f;
        button.center = center;
    }
    [self.view addSubview:button];
    
}
- (void)btnClicked:(UIButton *)sender
{
    self.selectedIndex = kQBCustom_Index;
    button.selected = YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    if (self.selectedIndex == kQBCustom_Index) {
        button.selected = YES;
    }else
    {
        button.selected = NO;
    }
}

@end
