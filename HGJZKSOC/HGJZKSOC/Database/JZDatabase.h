//
//  Database.h
//  HGJZKSOC
//
//  Created by john shi on 16/4/26.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>

@interface JZDatabase : NSObject

+ (instancetype)shareDatabase;

- (BOOL)executeUpdate:(NSString*)sql;
- (FMResultSet *)executeQuery:(NSString*)sql;

//- (void)openDataBase;
//- (void)closeDatabase;

@end
