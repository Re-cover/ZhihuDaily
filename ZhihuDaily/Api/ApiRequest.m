//
//  ApiRequest.m
//  ZhihuDaily
//
//  Created by Recover on 16/2/29.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "ApiRequest.h"
#import "AFHTTPSessionManager+SharedManager.h"
#import <YYModel.h>
#import "SplashModel.h"
#import "LatestStoriesModel.h"
#import "BeforeStoriesModel.h"
#import "StoryDetailModel.h"

NSString * const splashUrlString = @"https://news-at.zhihu.com/api/4/start-image/1080*1776";
NSString * const latestStoriesUrlString = @"https://news-at.zhihu.com/api/4/news/latest";
NSString * const beforeStoriesUrlString = @"https://news-at.zhihu.com/api/4/news/before/";
NSString * const storyDetailUrlString = @"https://news-at.zhihu.com/api/4/news/";

@implementation ApiRequest

/**
 *  获取载入画面信息
 *
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */
+ (void)splashModelComplete:(success)successBlock failure:(failure)failureBlock {
    [[AFHTTPSessionManager sharedManager] GET:splashUrlString
                                   parameters:nil
                                     progress:nil
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          SplashModel *model = [SplashModel yy_modelWithDictionary:responseObject];
                                          if (model) {
                                              successBlock(model);
                                          }
                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                          failureBlock(error);
                                      }];
}

/**
 *  获取当天新闻和图片轮播信息
 *
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */

+ (void)latestStoriesModelComplete:(success)successBlock failure:(failure)failureBlock {
    [[AFHTTPSessionManager sharedManager] GET:latestStoriesUrlString
                                   parameters:nil
                                     progress:nil
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          LatestStoriesModel *model = [LatestStoriesModel yy_modelWithDictionary:responseObject];
                                          //NSLog(@"%@", responseObject);
                                          if (model) {
                                              successBlock(model);
                                          }
                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                          failureBlock(error);
                                      }];
}

/**
 *  获取以往新闻
 *
 *  @param parameter    日期字符串
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */

+ (void)beforeStoriesModelWithParameter:(NSString *)parameter complete:(success)successBlock failure:(failure)failureBlock {
    [[AFHTTPSessionManager sharedManager] GET:[NSString stringWithFormat:@"%@%@", beforeStoriesUrlString, parameter]
                                   parameters:nil
                                     progress:nil
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          BeforeStoriesModel *model = [BeforeStoriesModel yy_modelWithDictionary:responseObject];
                                          if (model) {
                                              successBlock(model);
                                          }
                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                          failureBlock(error);
                                      }];
}

+ (void)storyDetailModelWithParameter:(id)paramter complete:(success)successBlock failure:(failure)failureBlock {
    [[AFHTTPSessionManager sharedManager] GET:[NSString stringWithFormat:@"%@%@", storyDetailUrlString, paramter]
                                   parameters:nil
                                    progress:nil
                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                          StoryDetailModel *model = [StoryDetailModel yy_modelWithDictionary:responseObject];
                                          if (model) {
                                              successBlock(model);
                                          }
                                      }
                                      failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                          failureBlock(error);
                                      }];
}


@end
