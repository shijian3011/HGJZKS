//
//  JZTabBarController.m
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/24.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZTabBarController.h"
#import "JZNoticeViewController.h"
#import "JZPracticeViewController.h"
#import "JZMineViewController.h"
#import "JZNavigationController.h"

@interface JZTabBarController ()

@end

@implementation JZTabBarController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor redColor];
    [self createView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - create view

- (void)createView {
    UIViewController *vc1 = [self generateTabBarItemWithClassName:NSStringFromClass([JZPracticeViewController class]) title:@"考试" norImageName:@"Tab1_nor" selImageName:@"Tab1_sel"];
    UIViewController *vc2 = [self generateTabBarItemWithClassName:NSStringFromClass([JZNoticeViewController class]) title:@"信息" norImageName:@"Tab2_nor" selImageName:@"Tab2_sel"];
    UIViewController *vc3 = [self generateTabBarItemWithClassName:NSStringFromClass([JZMineViewController class]) title:@"我的" norImageName:@"Tab3_nor" selImageName:@"Tab3_sel"];
    self.viewControllers = @[vc1, vc2, vc3];
}

- (UIViewController *)generateTabBarItemWithClassName:(NSString *)className title:(NSString *)title norImageName:(NSString *)norImageName selImageName:(NSString *)selImageName {
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:norImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor]} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    
    return vc;
}

@end
