//
//  LottieViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/9.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "LottieViewController.h"
#import <Lottie/Lottie.h>


@interface LottieViewController ()

@end

@implementation LottieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    LOTAnimationView *animationView =  [LOTAnimationView animationNamed:@"trail_loading"];
//    animationView.center = self.view.center;
//    animationView.bounds.size = CGSizeMake(200, 200);
    animationView.frame = CGRectMake(200, 100, 200, 200);
//    animationView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:animationView];
    [animationView play];
    animationView.loopAnimation = YES;
}



@end
