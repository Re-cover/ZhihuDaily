//
//  SlideModelCellModel.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "SlideModelCellModel.h"

@implementation SlideModelCellModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"description" : @"themeDescription",
             @"id" : @"themeId"};
}

@end
