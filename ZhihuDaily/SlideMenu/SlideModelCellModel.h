//
//  SlideModelCellModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

//               {
//                   "color": 15007,
//                   "thumbnail": "http://pic3.zhimg.com/0e71e90fd6be47630399d63c58beebfc.jpg",
//                   "description": "了解自己和别人，了解彼此的欲望和局限。",
//                   "id": 13,
//                   "name": "日常心理学"
//               },

@interface SlideModelCellModel : NSObject <YYModel>

@property (nonatomic, assign) NSInteger color;

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, copy) NSString *themeDescription;

@property (nonatomic, assign) NSInteger themeId;

@property (nonatomic, copy) NSString *name;

@end
