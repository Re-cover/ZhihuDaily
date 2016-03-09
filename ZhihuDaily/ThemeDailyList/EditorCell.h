//
//  EditorCell.h
//  ZhihuDaily
//
//  Created by Recover on 16/3/9.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditorCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage1;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage2;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage3;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage4;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage5;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImage6;

@property (strong, nonatomic) NSArray *avatarImageArray;

@end
