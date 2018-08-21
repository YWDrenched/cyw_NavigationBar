//
//  ThreeViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/2.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "ThreeViewController.h"
#import "CYW_AlertView.h"

@interface ThreeViewController ()

@property (nonatomic,weak)CYW_AlertView *alertView;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}

-(void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(200, 200, 50, 50);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

-(void)btnClick{
    self.alertView = [CYW_AlertView showAddView:self.view withTitleStr:@"提示" withMsgStr:@"123" withType:AlertViewTypeDetail];
    self.alertView.comfirmCompletion = ^(NSString *msgStr) {
        NSLog(@"%@",msgStr);
    };
}


@end
