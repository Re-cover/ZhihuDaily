//
//  SectionModel.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/7.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

//    "section": {
//        "thumbnail": "http://pic3.zhimg.com/fbd7fa7347d3718299c86edeaadb216e.jpg",
//        "id": 2,
//        "name": "瞎扯"
//    },

@interface SectionModel : NSObject<YYModel>

@property (nonatomic, copy) NSString *thumbnail;

@property (nonatomic, assign) NSInteger sectionId;

@property (nonatomic, copy) NSString *name;

@end
