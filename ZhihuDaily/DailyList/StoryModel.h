//
//  StoryModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface StoryModel : NSObject <YYModel>

@property (nonatomic, strong) NSArray<NSString *> *images;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger storyId;

@property (nonatomic, copy) NSString *ga_prefix;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) BOOL multipic;

@property (nonatomic, assign) BOOL isRead;

@end
