//
//  AttachViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "AttachViewController.h"
#import "TestView.h"

@interface AttachViewController ()
@property (nonatomic,strong)UIDynamicAnimator *animator;
@property (nonatomic,strong)UIView *greendView;
@property (nonatomic,strong)TestView *testView;
@end

@implementation AttachViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.testView = [[TestView alloc] initWithFrame:self.view.bounds];
    self.testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _greendView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _greendView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greendView];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    __weak typeof(self)weakSelf = self;
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    
    UIAttachmentBehavior *behavior = [[UIAttachmentBehavior alloc] initWithItem:self.greendView attachedToAnchor:[touches.anyObject locationInView:self.view]];
    behavior.length = 180;
//    action为行为过程中的回调
    behavior.action = ^{
        weakSelf.testView.end = [self.view convertPoint:CGPointMake(50, 50) fromView:self.greendView];
        weakSelf.testView.start = [touches.anyObject locationInView:self.view];
    };
  
    UIGravityBehavior *graBehavior = [[UIGravityBehavior alloc] initWithItems:@[self.greendView]];

    [self.animator addBehavior:behavior];
    [self.animator addBehavior:graBehavior];
}


@end
