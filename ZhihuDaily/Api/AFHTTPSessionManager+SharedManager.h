//
//  AFHTTPSessionManager+SharedManager.h
//  ZhihuDaily
//
//  Created by Recover on 16/2/27.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface AFHTTPSessionManager (SharedManager)

+ (instancetype)sharedManager;

@end
