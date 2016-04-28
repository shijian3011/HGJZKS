//
//  JZBaseTable.m
//  HGJZKSOC
//
//  Created by john shi on 16/4/28.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZBaseTable.h"
#import "JZDatabase.h"
#import "JZQuestionModel.h"

@implementation JZBaseTable

#pragma mark - public method

+ (BOOL)addQuestion:(JZQuestionModel *)question {
    NSString *tableName = [self getTableName];
    if (!tableName.length) {
        return NO;
    }
    
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (num, content, answer, imageurl, helper) VALUES (%d, \"%@\", %d, \"%@\", \"%@\")", tableName, question.num.intValue, question.content, question.answer.intValue, question.imageurl, question.helper];
    return [[JZDatabase shareDatabase] executeUpdate:sql];
}

+ (BOOL)addQuestions:(NSArray *)questions {
    NSString *tableName = [self getTableName];
    if (!tableName.length) {
        return NO;
    }
    
    for (NSInteger index = 0; index < questions.count; index++) {
        JZQuestionModel *question = questions[index];
        NSString *sql = [NSString stringWithFormat:@"INSERT INTO %@ (num, content, answer, imageurl, helper) VALUES (%d, \"%@\", %d, \"%@\", \"%@\")", tableName, question.num.intValue, question.content, question.answer.intValue, question.imageurl, question.helper];
        BOOL result = [[JZDatabase shareDatabase] executeUpdate:sql];
        NSLog(@"result is %@", result ? @"YES":@"NO");
    }
    
    return YES;
}

+ (BOOL)clearTable {
    NSString *sql = [NSString stringWithFormat:@"DELETE TABLE %@", [self getTableName]];
    return [[JZDatabase shareDatabase] executeUpdate:sql];
}

+ (BOOL)deleteTable {
    NSString *sql = [NSString stringWithFormat:@"DROP TABLE %@", [self getTableName]];
    return [[JZDatabase shareDatabase] executeUpdate:sql];
}

+ (JZQuestionModel *)queryQuestionWithIndex:(NSInteger)index {
    NSString *tableName = [self getTableName];
    if (!tableName.length) {
        return nil;
    }
    
    NSString *sql = [NSString stringWithFormat:@"SELECT *FROM %@ WHERE num=%ld", tableName, (long)index];
    FMResultSet *fmResultSet = [[JZDatabase shareDatabase] executeQuery:sql];
    
    while ([fmResultSet next]) {
        JZQuestionModel *question = [[JZQuestionModel alloc] init];
        question.num = @([fmResultSet intForColumn:@"num"]);
        question.content = [fmResultSet stringForColumn:@"content"];
        question.answer = @([fmResultSet intForColumn:@"answer"]);
        question.imageurl = [fmResultSet stringForColumn:@"imageurl"];
        question.helper = [fmResultSet stringForColumn:@"helper"];
        return question;
    }
    
    return nil;
}

+ (NSArray *)queryQuestionWithRange:(NSRange)range {
//    sql="select * from 数据表 where字段名between 值1 and 值2"
    NSString *tableName = [self getTableName];
    if (!tableName.length) {
        return nil;
    }
    
    NSString *sql = [NSString stringWithFormat:@"SELECT *FROM %@ WHERE num BETWEEN %ld AND %ld", tableName, range.location, range.location+range.length-1];
    FMResultSet *fmResultSet = [[JZDatabase shareDatabase] executeQuery:sql];
    
    NSMutableArray *questions = [NSMutableArray array];
    while ([fmResultSet next]) {
        JZQuestionModel *question = [[JZQuestionModel alloc] init];
        question.num = @([fmResultSet intForColumn:@"num"]);
        question.content = [fmResultSet stringForColumn:@"content"];
        question.answer = @([fmResultSet intForColumn:@"answer"]);
        question.imageurl = [fmResultSet stringForColumn:@"imageurl"];
        question.helper = [fmResultSet stringForColumn:@"helper"];
        
        [questions addObject:question];
    }
    
    return questions;
}

+ (NSArray *)queryAllQuestions {
    NSString *tableName = [self getTableName];
    if (!tableName.length) {
        return nil;
    }
    
    NSString *sql = [NSString stringWithFormat:@"SELECT *FROM %@", tableName];
    FMResultSet *fmResultSet = [[JZDatabase shareDatabase] executeQuery:sql];
    
    NSMutableArray *questions = [NSMutableArray array];
    while ([fmResultSet next]) {
        JZQuestionModel *question = [[JZQuestionModel alloc] init];
        question.num = @([fmResultSet intForColumn:@"num"]);
        question.content = [fmResultSet stringForColumn:@"content"];
        question.answer = @([fmResultSet intForColumn:@"answer"]);
        question.imageurl = [fmResultSet stringForColumn:@"imageurl"];
        question.helper = [fmResultSet stringForColumn:@"helper"];
        
        [questions addObject:question];
    }
    
    return questions;
}

#pragma mark - private method

+ (NSString *)getTableName {
    NSString *className = NSStringFromClass([self class]);

    if ([className isEqualToString:@"JZYesOrNoTable"]) {
        return @"YesOrNoTable";
    } else if ([className isEqualToString:@"JZFirstCategoryTable"]) {
        return @"FirstCategoryTable";
    } else if ([className isEqualToString:@"JZSecondCategoryTable"]) {
        return @"SecondCategoryTable";
    } else {
        return nil;
    }
}

@end
