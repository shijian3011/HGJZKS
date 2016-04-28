//
//  JZHttpsNetworkRequest.h
//  HGJZKSOC
//
//  Created by john shi on 16/4/26.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpsNetworkBlock)(id result, NSString *error);
typedef void(^FileBlock)(BOOL isSuccess, NSString *filePath);

@interface JZHttpsNetworkRequest : NSObject

+ (void)requestWithFileName:(NSString *)fileName completedBlock:(HttpsNetworkBlock)block;

+ (void)requestWithVedioName:(NSString *)vedioName completeBlock:(HttpsNetworkBlock)block;

@end
