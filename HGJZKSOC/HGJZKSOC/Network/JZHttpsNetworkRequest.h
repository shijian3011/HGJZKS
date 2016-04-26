//
//  JZHttpsNetworkRequest.h
//  HGJZKSOC
//
//  Created by john shi on 16/4/26.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^HttpsNetworkBlock)(id result, NSString *error);

@interface JZHttpsNetworkRequest : NSObject

+ (void)requestWithFileName:(NSString *)fileName completedBlock:(HttpsNetworkBlock)block;

@end
