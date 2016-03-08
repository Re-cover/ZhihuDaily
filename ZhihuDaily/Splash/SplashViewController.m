//
//  SplashViewController.m
//  ZhihuDaily
//
//  Created by Recover on 16/2/27.
//  Copyright © 2016年 Recover. All rights reserved.
//

#import "SplashViewController.h"
#import "SplashModel.h"
#import "SplashView.h"
#import "ApiRequest.h"
#import <YYWebImage.h>
#import <Masonry.h>

@interface SplashViewController ()

@property (nonatomic, strong) SplashView *splashView;
@property (nonatomic, strong) SplashModel *splashModel;

@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.splashView = [[SplashView alloc] init];
    [self.view addSubview:self.splashView.backgroundImageView];
    [self.view addSubview:self.splashView.logoImageView];
    [self.view addSubview:self.splashView.copyrightLabel];
    [self layoutPageSubviews];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    @weakify(self);
    [ApiRequest splashModelComplete:^(SplashModel *model) {
        weak_self.splashModel = model;
        [weak_self.splashView.backgroundImageView yy_setImageWithURL:[NSURL URLWithString:model.img] placeholder:nil];
        [weak_self.splashView.copyrightLabel setText:model.text];
        [UIView animateWithDuration:2.5
                         animations:^{
                             [weak_self.splashView.backgroundImageView setTransform:CGAffineTransformMakeScale(1.1, 1.1)];
                         } completion:^(BOOL finished) {
                             NSLog(@"Animation Complete.");
                             [weak_self performSegueWithIdentifier:@"toDailyListSegue" sender:self];
                         }];
    } failure:^(NSError *error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

- (void)layoutPageSubviews {
    [self.splashView.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    [self.splashView.logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(400, 0, 0, 0));
    }];
    [self.splashView.copyrightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.centerX.mas_equalTo(self.view.mas_centerX);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(20);
        make.height.equalTo(@80);
    }];
}

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews]
//}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
