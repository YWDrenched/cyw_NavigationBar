//
//  BezierPathViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/22.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "BezierPathViewController.h"
#import "BezierView.h"

@interface BezierPathViewController ()

@end

@implementation BezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    BezierView *view = [[BezierView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
}



@end
