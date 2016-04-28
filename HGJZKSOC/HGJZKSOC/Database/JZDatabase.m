//
//  Database.m
//  HGJZKSOC
//
//  Created by john shi on 16/4/26.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZDatabase.h"

@interface JZDatabase ()

@property (nonatomic, strong) FMDatabase *fmDatabase;

@property (nonatomic, strong) dispatch_queue_t fmDatabaseQueue;

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

- (BOOL)executeUpdate:(NSString *)sql {
    __block BOOL result;
    dispatch_sync(self.fmDatabaseQueue, ^{
        result = [self.fmDatabase executeUpdate:sql];
    });
    return result;
}

- (FMResultSet *)executeQuery:(NSString *)sql {
    return [self.fmDatabase executeQuery:sql];
}

#pragma mark - fmdb

- (void)createFMDatabase {
    self.fmDatabaseQueue = dispatch_queue_create("JZFMdabaseQueue", DISPATCH_QUEUE_SERIAL);
    
    NSArray *pathList = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *dbPath = [NSString stringWithFormat:@"%@/DrivingTest.db",[pathList firstObject]];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isExist = [fileManager fileExistsAtPath:dbPath];
    if (!isExist) {
        [fileManager createFileAtPath:dbPath contents:nil attributes:nil];
    }
    
    self.fmDatabase = [FMDatabase databaseWithPath:dbPath];
    
    if ([self.fmDatabase open]) {
        [self createSqliteTables];
    } else {
        NSLog(@"fmdb open 失败");
    }
}

- (void)createSqliteTables {
    NSString *createYesOrNoTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS YesOrNoTable (num int PRIMARY KEY, content text, answer int, imageurl text, helper text)"];
    NSString *createFirstCategoryTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS FirstCategoryTable (num int PRIMARY KEY, content text, answer int, imageurl text, helper text)"];
    NSString *createSecondCategoryTable = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS SecondCategoryTable (num int PRIMARY KEY, content text, answer int, imageurl text, helper text)"];
    [self.fmDatabase executeUpdate:createYesOrNoTable];
    [self.fmDatabase executeUpdate:createFirstCategoryTable];
    [self.fmDatabase executeUpdate:createSecondCategoryTable];    
}

#pragma mark - function method






@end
