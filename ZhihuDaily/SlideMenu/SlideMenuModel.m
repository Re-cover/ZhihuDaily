//
//  SlideMenuModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/8.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "SlideMenuModel.h"
#import "SlideModelCellModel.h"

@implementation SlideMenuModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"subscribed" : [SlideModelCellModel class],
             @"others" : [SlideModelCellModel class]};
}

@end
