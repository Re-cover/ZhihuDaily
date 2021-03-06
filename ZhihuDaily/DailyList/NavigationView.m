//
//  NavigationView.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/6.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "NavigationView.h"
#import <Masonry.h>

@implementation NavigationView

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:23/255. green:144/255. blue:211/255. alpha:0]];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(30, 50, 10, 50));
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] init];
        [self.titleLabel setText:@"今日热闻"];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self.titleLabel setTextColor:[UIColor whiteColor]];
        [self.titleLabel setFont:[UIFont fontWithName:@"PingFang SC" size:18]];
        [self.titleLabel setNumberOfLines:1];
    }
    return _titleLabel;
}

@end
