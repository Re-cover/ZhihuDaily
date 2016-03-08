//
//  StoryDetailWebView.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StoryDetailModel;

@interface StoryDetailWebView : UIWebView

@property (nonatomic, strong) StoryDetailModel *model;

@end
