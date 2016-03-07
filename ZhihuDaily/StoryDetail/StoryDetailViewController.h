//
//  StoryDetailViewController.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryDetailViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@property (nonatomic, copy) NSString *storyId;

@end
