//
//  NetworkClient.m
//  ZhihuDaily
//
//  Created by Recover on 16/2/27.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "NetworkClient.h"
#import <AFNetworking.h>

@implementation NetworkClient

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
    }
    return self;
}

+ (instancetype)shareClient {
    static NetworkClient *client;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        client = [[NetworkClient alloc] init];
    });
    return client;
}

@end
