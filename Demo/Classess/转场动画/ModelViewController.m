//
//  ModelViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/7.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"581533631253_.pic"]];
    image.frame = self.view.bounds;
    [self.view addSubview:image];
}



@end
