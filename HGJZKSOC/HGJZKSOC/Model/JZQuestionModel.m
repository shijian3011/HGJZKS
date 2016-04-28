//
//  JZQuestionModel.m
//  HGJZKSOC
//
//  Created by john shi on 16/4/28.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZQuestionModel.h"

@implementation JZQuestionModel

+ (NSArray *)questionsWithString:(NSString *)string {
    NSArray *lines = [string componentsSeparatedByString:@"\n"];
    NSMutableArray *questions = [NSMutableArray array];
    for (NSString *line in lines) {
        JZQuestionModel *question = [[JZQuestionModel alloc] initWithString:line];
        [questions addObject:question];
    }
    return questions;
}

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    
    if (self) {
        NSArray *lines = [string componentsSeparatedByString:@" "];
        if (lines.count>=3) {
            NSString *numStr = lines[0];
            NSString *answerStr = lines[2];
            self.num = @(numStr.integerValue);
            self.content = lines[1];
            self.answer = @(answerStr.integerValue);
        }
    }
    
    return self;
}

@end
