//
//  JZNoticeViewController.m
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/4/24.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZNoticeViewController.h"
#import "JZNoticeCell.h"
#import <UIImageView+WebCache.h>

@interface JZNoticeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation JZNoticeViewController

static NSString *const jzNoticeID = @"jzNoticeID";

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.navigationItem.title = @"练习页面";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - create view

- (void)createView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kFBaseY, kFBaseWidth, kFBaseHeight-kFBaseY-kFBaseTabBarHeight) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor greenColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"JZNoticeCell" bundle:nil] forCellReuseIdentifier:jzNoticeID];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JZNoticeCell *cell = [tableView dequeueReusableCellWithIdentifier:jzNoticeID];
    
    NSString *imageUrlStr = nil;
    if (indexPath.row == 0 || indexPath.row == 4 || indexPath.row == 5 ||indexPath.row == 6 ||indexPath.row == 7 ||indexPath.row == 9) {
        imageUrlStr = [NSString stringWithFormat:@"http://7u2t53.com1.z0.glb.clouddn.com/12_27%ld.png",indexPath.row];
    } else {
        imageUrlStr = [NSString stringWithFormat:@"http://7u2t53.com1.z0.glb.clouddn.com/12_27%ld.jpg",indexPath.row];
    }
    
    [cell.tipIV sd_setImageWithURL:[NSURL URLWithString:imageUrlStr] placeholderImage:[UIImage imageNamed:@"Tab1_nor"]];
    
    return cell;
}


@end
