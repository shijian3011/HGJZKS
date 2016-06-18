//
//  JZLabel.m
//  HGJZKSOC
//
//  Created by SHIJIAN on 16/5/23.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZLabel.h"

@implementation JZLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)layoutSubviews {
    [super layoutSubviews];
    self.font = [UIFont systemFontOfSize:arc4random()%10 + 10];
}

@end
