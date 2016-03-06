//
//  TopStoryModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopStoryModel : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger topStoryId;

@property (nonatomic, copy) NSString *ga_prefix;

@property (nonatomic, copy) NSString *title;

@end
