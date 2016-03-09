//
//  ApiRequest.h
//  ZhihuDaily
//
//  Created by Recover on 16/2/29.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^success)(id);
typedef void(^failure)(NSError *error);

@interface ApiRequest : NSObject

+ (void)splashModelComplete:(success)successBlock failure:(failure)failureBlock;

+ (void)latestStoriesModelComplete:(success)successBlock failure:(failure)failureBlock;

+ (void)beforeStoriesModelWithParameter:(id)parameter complete:(success)successBlock failure:(failure)failureBlock;

+ (void)storyDetailModelWithParameter:(id)paramter complete:(success)successBlock failure:(failure)failureBlock;

+ (void)slideMenuModelComplete:(success)successBlock failure:(failure)failureBlock;

+ (void)themeStoriesModelWithParameter:(id)paramter complete:(success)successBlock failure:(failure)failureBlock;

@end
