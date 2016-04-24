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

@interface JZTabBarController ()

@end

@implementation JZTabBarController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - create view

- (void)createView {
    
    UIButton *practiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    practiceButton.frame = CGRectMake(0, 0, kFBaseWidth/3, kFBaseTabBarHeight);
    practiceButton.titleLabel.font = [UIFont systemFontOfSize:14];
    practiceButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [practiceButton setTitle:@"考试" forState:UIControlStateNormal];
    [practiceButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [practiceButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [practiceButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    UIBarButtonItem *practiceItem = [[UIBarButtonItem alloc] initWithCustomView:practiceButton];
    practiceItem.width = kFBaseWidth/3;

    UIButton *noticeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    noticeButton.frame = CGRectMake(0, 0, kFBaseWidth/3, kFBaseTabBarHeight);
    noticeButton.titleLabel.font = [UIFont systemFontOfSize:14];
    noticeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [noticeButton setTitle:@"信息" forState:UIControlStateNormal];
    [noticeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [noticeButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [noticeButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    UIBarButtonItem *noticeItem = [[UIBarButtonItem alloc] initWithCustomView:noticeButton];
    noticeItem.width = kFBaseWidth/3;

    UIButton *mineButton = [UIButton buttonWithType:UIButtonTypeCustom];
    mineButton.frame = CGRectMake(0, 0, kFBaseWidth/3, kFBaseTabBarHeight);
    mineButton.titleLabel.font = [UIFont systemFontOfSize:14];
    mineButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [mineButton setTitle:@"我的" forState:UIControlStateNormal];
    [mineButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [mineButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [mineButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected | UIControlStateHighlighted];
    UIBarButtonItem *mineItem = [[UIBarButtonItem alloc] initWithCustomView:mineButton];
    mineItem.width = kFBaseWidth / 3;
    
    self.toolbarItems = @[practiceItem, noticeItem, mineItem];
    
    self.viewControllers = @[[[JZPracticeViewController alloc] init], [[JZNoticeViewController alloc] init], [[JZMineViewController alloc] init]];
}


@end
