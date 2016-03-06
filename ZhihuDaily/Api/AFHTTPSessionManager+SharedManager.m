//
//  AFHTTPSessionManager+SharedManager.m
//  ZhihuDaily
//
//  Created by Recover on 16/2/27.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "AFHTTPSessionManager+SharedManager.h"

@implementation AFHTTPSessionManager (SharedManager)

+ (instancetype)sharedManager {
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [AFHTTPSessionManager manager];
    });
    return manager;
}
@end
