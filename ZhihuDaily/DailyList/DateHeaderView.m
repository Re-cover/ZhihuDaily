//
//  DateHeaderView.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "DateHeaderView.h"
#import <Masonry.h>

@implementation DateHeaderView

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    if (self) {
        [self setBackgroundColor:[UIColor colorWithRed:23/255. green:144/255. blue:211/255. alpha:1]];
        
        [self addSubview:self.dateLabel];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(10, 40, 10, 40));
        }];
    }
    return self;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        self.dateLabel = [[UILabel alloc] init];
        [self.dateLabel setText:@""];
        [self.dateLabel setTextAlignment:NSTextAlignmentCenter];
        [self.dateLabel setTextColor:[UIColor whiteColor]];
        [self.dateLabel setFont:[UIFont fontWithName:@"PingFang SC" size:18]];
        [self.dateLabel setNumberOfLines:1];
    }
    return _dateLabel;
}

@end
