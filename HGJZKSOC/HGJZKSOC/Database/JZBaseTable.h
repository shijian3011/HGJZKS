//
//  JZBaseTable.h
//  HGJZKSOC
//
//  Created by john shi on 16/4/28.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JZQuestionModel;

@interface JZBaseTable : NSObject

+ (BOOL)addQuestion:(JZQuestionModel *)question;//单条增加
+ (BOOL)addQuestions:(NSArray *)questions;//批量增加

+ (BOOL)clearTable;//清空记录，但不删除表
+ (BOOL)deleteTable;//删除表

+ (JZQuestionModel *)queryQuestionWithIndex:(NSInteger)index;//根据题号查询记录
+ (NSArray *)queryQuestionWithRange:(NSRange)range;//根据范围查询记录
+ (NSArray *)queryAllQuestions;//查询表内所有数据

@end
