//
//  JZPracticeViewController.m
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/24.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZPracticeViewController.h"
#import "JZHttpsNetworkRequest.h"
#import "JZYesOrNoTable.h"
#import "JZFirstCategoryTable.h"
#import "JZSecondCategoryTable.h"
#import "JZQuestionModel.h"

@interface JZPracticeViewController ()

@end

@implementation JZPracticeViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [JZHttpsNetworkRequest requestWithFileName:@"%E5%88%A4%E6%96%AD%E9%A2%98.txt" completedBlock:^(NSURL *result, NSString *error) {
        [self getTest:result];
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"practice view controller";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - create view


#pragma mark - network

- (void)getTest:(NSURL *)filePath {
    if (!filePath) {
        return;
    }
    NSString *test = [NSString stringWithContentsOfURL:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *questions = [JZQuestionModel questionsWithString:test];
    [JZYesOrNoTable addQuestions:questions];
    
    NSArray *cachedQuestions = [JZYesOrNoTable queryAllQuestions];
    NSLog(@"%@", cachedQuestions);
}

@end
