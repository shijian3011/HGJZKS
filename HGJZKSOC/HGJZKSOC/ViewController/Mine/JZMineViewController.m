//
//  JZMineViewController.m
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/24.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZMineViewController.h"

@interface JZMineViewController ()

@end

@implementation JZMineViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title= @"我的页面";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
