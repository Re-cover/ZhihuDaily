//
//  TopImageView.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/5.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "TopImageView.h"
#import "TopStoryModel.h"
#import "StoryDetailModel.h"
#import <Masonry.h>
#import <YYWebImage.h>

@implementation TopImageView

- (instancetype)init {
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    if (self) {
        @weakify(self);
        [self addSubview:self.topStoryImage];
        [self.topStoryImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [self addSubview:self.maskImageView];
        [self.maskImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [self addSubview:self.topStoryTitleLabel];
        [self.topStoryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self).with.insets(UIEdgeInsetsMake(100, 24, 20, 24));
        }];
        
        [self addSubview:self.imageSourceLabel];
        [self.imageSourceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self).with.insets(UIEdgeInsetsMake(180, 24, 10, 24));
        }];
        
    }
    return self;
}

- (UIImageView *)topStoryImage {
    if (!_topStoryImage) {
        self.topStoryImage = [[UIImageView alloc] init];
        [self.topStoryImage setBackgroundColor:[UIColor grayColor]];
        [self.topStoryImage setContentMode:UIViewContentModeScaleAspectFill];
        [self.topStoryImage setClipsToBounds:YES];
        [self.topStoryImage setContentScaleFactor:[[UIScreen mainScreen] scale]];
        [self.topStoryImage setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    }
    return  _topStoryImage;
}

- (UILabel *)topStoryTitleLabel {
    if (!_topStoryTitleLabel) {
        self.topStoryTitleLabel = [[UILabel alloc] init];
        [self.topStoryTitleLabel setText:@""];
        [self.topStoryTitleLabel setTextColor:[UIColor whiteColor]];
        [self.topStoryTitleLabel setFont:[UIFont fontWithName:@"PingFang SC" size:20]];
        [self.topStoryTitleLabel setTextAlignment:NSTextAlignmentJustified];
        [self.topStoryTitleLabel setNumberOfLines:3];
    }
    return _topStoryTitleLabel;
}

- (UIImageView *)maskImageView {
    if (!_maskImageView) {
        self.maskImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Home_Image_Mask"]];
        [self.maskImageView setContentMode:UIViewContentModeScaleAspectFill];
        [self.maskImageView setClipsToBounds:YES];
        [self.maskImageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
        [self.maskImageView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    }
    return  _maskImageView;
}

- (UILabel *)imageSourceLabel {
    if (!_imageSourceLabel) {
        self.imageSourceLabel = [[UILabel alloc] init];
        [self.imageSourceLabel setText:@""];
        [self.imageSourceLabel setTextColor:[UIColor whiteColor]];
        [self.imageSourceLabel setFont:[UIFont fontWithName:@"PingFang SC" size:10]];
        [self.imageSourceLabel setTextAlignment:NSTextAlignmentRight];
        [self.imageSourceLabel setNumberOfLines:1];
    }
    return _imageSourceLabel;
}

- (void)setTopStoryModel:(TopStoryModel *)topStoryModel {
    _topStoryModel = topStoryModel;
     NSURL *url = [NSURL URLWithString:topStoryModel.image];
    [self.topStoryImage yy_setImageWithURL:url placeholder:nil];
    [self.topStoryTitleLabel setText:topStoryModel.title];
}

- (void)setStoryDetailModel:(StoryDetailModel *)storyDetailModel {
    _storyDetailModel = storyDetailModel;
    NSURL *url = [NSURL URLWithString: storyDetailModel.image];
    [self.topStoryImage yy_setImageWithURL:url placeholder:nil];
    [self.topStoryTitleLabel setText:storyDetailModel.title];
    [self.imageSourceLabel setText:[NSString stringWithFormat:@"图片：%@", storyDetailModel.image_source]];
}

@end
