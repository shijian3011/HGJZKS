//
//  JZQuestionModel.h
//  HGJZKSOC
//
//  Created by john shi on 16/4/28.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZBaseModel.h"

@interface JZQuestionModel : JZBaseModel

@property (nonatomic, strong) NSNumber *num;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSNumber *answer;
@property (nonatomic, copy) NSString *imageurl;
@property (nonatomic, copy) NSString *helper;

+ (NSArray *)questionsWithString:(NSString *)string;

- (instancetype)initWithString:(NSString *)string;

@end
