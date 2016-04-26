//
//  JZPracticeViewController.m
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/24.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZPracticeViewController.h"
#import "JZHttpsNetworkRequest.h"

@interface JZPracticeViewController ()

@end

@implementation JZPracticeViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self getTest];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"考试页面";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - create view


#pragma mark - network

- (void)getTest {
    [JZHttpsNetworkRequest requestWithFileName:@"%E5%88%A4%E6%96%AD%E9%A2%98.txt" completedBlock:^(id result, NSString *error) {
        NSLog(@"result is %@, error is %@", result, error);
    }];
}

@end
