//
//  Database.m
//  HGJZKSOC
//
//  Created by john shi on 16/4/26.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "Database.h"
#import <FMDB/FMDB.h>

@interface Database ()

@property (nonatomic, strong) FMDatabase *fmDatabase;

@end

@implementation Database

#pragma mark - public method

+ (instancetype)shareDatabase {
    static Database *database = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        database = [[Database alloc] init];
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
    } else {
        NSLog(@"失败");
    }
}

- (void)createSqlite {
//    NSString *create ;
    
}

@end
