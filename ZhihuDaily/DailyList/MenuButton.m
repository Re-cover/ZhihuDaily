//
//  MenuButton.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "MenuButton.h"

@implementation MenuButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setImage:[UIImage imageNamed:@"Home_Icon"] forState:(UIControlStateNormal)];
        [self setImage:[UIImage imageNamed:@"Home_Icon_Highlight"] forState:UIControlStateHighlighted];
    }
    return self;
}

@end
