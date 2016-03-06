//
//  NetworkClient.h
//  ZhihuDaily
//
//  Created by Recover on 16/2/27.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface NetworkClient : NSObject

@property (nonatomic, strong, readonly) AFHTTPSessionManager *manager;

+ (instancetype)shareClient;

@end
