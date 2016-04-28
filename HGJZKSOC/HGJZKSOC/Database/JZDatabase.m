//
//  Database.m
//  HGJZKSOC
//
//  Created by john shi on 16/4/26.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZDatabase.h"
#import <FMDB/FMDB.h>

@interface JZDatabase ()

@property (nonatomic, strong) FMDatabase *fmDatabase;

@end

@implementation JZDatabase

#pragma mark - public method

+ (instancetype)shareDatabase {
    static JZDatabase *database = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        database = [[JZDatabase alloc] init];
        [database createFMDatabase];
    });
    
    return database;
}

#pragma mark - fmdb

- (void)createFMDatabase {
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath = [NSString stringWithFormat:@"%@/DrivingTest.db",[pathList firstObject]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:dbPath];
    if (!isExist) {
        [fileManager createFileAtPath:dbPath contents:nil attributes:nil];
    }
    
    self.fmDatabase = [FMDatabase databaseWithPath:dbPath];
    
    if ([self.fmDatabase open]) {
        NSLog(@"成功");
        [self createSqliteTables];
        
    } else {
        NSLog(@"失败");
    }
}

- (void)createSqliteTables {
    NSString *createYesOrNoTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS YesOrNoTable (id int PRIMARY KEY, content text, answer int, imageurl text)"];
    NSString *createFirstCategoryTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS FirstCategoryTable (id int PRIMARY KEY, content text, answer int, imageurl text)"];
    NSString *createSecondCategoryTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS SecondCategoryTable (id int PRIMARY KEY, content text, answer int, imageurl text)"];
    [self.fmDatabase executeUpdate:createYesOrNoTable];
    [self.fmDatabase executeUpdate:createFirstCategoryTable];
    [self.fmDatabase executeUpdate:createSecondCategoryTable];
    
    [self.fmDatabase executeUpdateWithFormat:@"INSERT INTO YesOrNoTable (id, content, answer, imageurl) VALUES (%d,%@,%d,%@)", 1, @"testtesttesttesttest", 1, @"fadsfa.jpg"];
}

#pragma mark - function method






@end
