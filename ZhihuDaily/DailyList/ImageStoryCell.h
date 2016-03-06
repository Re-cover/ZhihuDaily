//
//  ImageStoryCell.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageStoryCell : UITableViewCell

@property (nonatomic, strong) UILabel *storyTitleLabel;

@property (nonatomic, strong) UIImageView *storyImageView;

@property (nonatomic, strong) UIImageView *multiPicImageView;

@property (nonatomic, strong) NSTimer *timer;

@end
