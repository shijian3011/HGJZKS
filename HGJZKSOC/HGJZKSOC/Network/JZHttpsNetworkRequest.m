//
//  JZHttpsNetworkRequest.m
//  HGJZKSOC
//
//  Created by john shi on 16/4/26.
//  Copyright © 2016年 Stone Bell Hill. All rights reserved.
//

#import "JZHttpsNetworkRequest.h"
#import <AFNetworking.h>

@implementation JZHttpsNetworkRequest

+ (void)requestWithFileName:(NSString *)fileName completedBlock:(HttpsNetworkBlock)block {
    //https://o68avhu48.qnssl.com/
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"https://o68avhu48.qnssl.com/%@",fileName]];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress){
        NSLog(@"%@", downloadProgress);
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}

+ (void)requestWithVedioName:(NSString *)vedioName completeBlock:(HttpsNetworkBlock)block {


}

@end
