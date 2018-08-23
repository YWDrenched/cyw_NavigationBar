//
//  SanpViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "SanpViewController.h"

@interface SanpViewController ()

@property (nonatomic,strong)UIDynamicAnimator *animator;
@property (nonatomic,strong)UIView *greendView;
@end

@implementation SanpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _greendView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _greendView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greendView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UISnapBehavior *behavior = [[UISnapBehavior alloc] initWithItem:self.greendView snapToPoint:[touches.anyObject locationInView:self.view] ];
    behavior.damping = 0.9;
                                
    [self.animator addBehavior:behavior];

}


@end
