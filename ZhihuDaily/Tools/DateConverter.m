//
//  DateConverter.m
//  ZhihuDaily
//
//  Created by Recover on 16/3/2.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "DateConverter.h"

@implementation DateConverter

+ (NSString *)zhihuDateWith:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [NSLocale localeWithLocaleIdentifier:@"zh-CN"];
    dateFormatter.dateFormat = @"yyyyMMdd";
    NSDate *date = [dateFormatter dateFromString:dateString];
    dateFormatter.dateFormat = @"MM月dd日 EEEE";
    NSString *zhihuDate = [dateFormatter stringFromDate:date];
    return zhihuDate;
}

@end
