//
//  SlideMenuModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/8.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>
@class SlideModelCellModel;
//{
//    "limit": 1000,
//    "subscribed": [],
//    "others": [
//               ]
//}

@interface SlideMenuModel : NSObject <YYModel>

@property (nonatomic, assign) NSInteger limit;

@property (nonatomic, strong) NSMutableArray<SlideModelCellModel *> *subscribed;

@property (nonatomic, strong) NSMutableArray<SlideModelCellModel *> *others;

@end
