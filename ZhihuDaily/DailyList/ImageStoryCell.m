//
//  ImageStoryCell.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/1.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "ImageStoryCell.h"
#import <Masonry.h>

#define weakify(object) autoreleasepool{} __weak typeof(object) weak_##object = object;

@implementation ImageStoryCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    if (selected) {
        [self.storyTitleLabel setTextColor:[UIColor grayColor]];
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        @weakify(self);
        [self addSubview:self.storyTitleLabel];
        [self.storyTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self).with.insets(UIEdgeInsetsMake(10, 15, 10, 100));
        }];
        
        [self addSubview:self.storyImageView];
        [self.storyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self).with.insets(UIEdgeInsetsMake(15, 285, 15, 15));
        }];
        
        [self addSubview:self.multiPicturesLabel];
        [self.multiPicturesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weak_self.storyImageView).with.insets(UIEdgeInsetsMake(45, 50, 0, 0));
        }];
    }
    return self;
}

- (UILabel *)storyTitleLabel {
    if (!_storyTitleLabel) {
        self.storyTitleLabel = [[UILabel alloc] init];
        [self.storyTitleLabel setText:@""];
        [self.storyTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [self.storyTitleLabel setTextColor:[UIColor blackColor]];
        [self.storyTitleLabel setFont:[UIFont fontWithName:@"PingFang SC" size:15]];
        [self.storyTitleLabel setNumberOfLines:3];
    }
    return _storyTitleLabel;
}


- (UIImageView *)storyImageView {
    if (!_storyImageView) {
        self.storyImageView = [[UIImageView alloc] init];;
        [self.storyImageView setContentMode:UIViewContentModeCenter];
        [self.storyImageView setClipsToBounds:YES];
        [self.storyImageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    }
    return _storyImageView;
}

- (UILabel *)multiPicturesLabel{
    if (!_multiPicturesLabel) {
        self.multiPicturesLabel = [[UILabel alloc] init];
        [self.multiPicturesLabel setHidden:YES];
        [self.multiPicturesLabel setText:@"多图"];
        [self.multiPicturesLabel setTextAlignment:NSTextAlignmentCenter];
        [self.multiPicturesLabel setTextColor:[UIColor whiteColor]];
        [self.multiPicturesLabel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
        [self.multiPicturesLabel setFont:[UIFont fontWithName:@"PingFang SC" size:10]];
    }
    return _multiPicturesLabel;
}
@end
