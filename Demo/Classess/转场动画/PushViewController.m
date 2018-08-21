//
//  PushViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/8.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"转场push";
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"581533631253_.pic"]];
    image.frame = self.view.bounds;
    [self.view addSubview:image];
}



@end
