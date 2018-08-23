//
//  PushBViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "PushBViewController.h"

@interface PushBViewController ()
@property (nonatomic,strong)UIDynamicAnimator *animator;
@property (nonatomic,strong)UIView *greendView;
@end

@implementation PushBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _greendView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _greendView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greendView];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIPushBehavior *pushB = [[UIPushBehavior alloc] initWithItems:@[self.greendView] mode:UIPushBehaviorModeContinuous];
    
    [pushB setAngle:0 magnitude:10];
    
    UICollisionBehavior *collisionB = [[UICollisionBehavior alloc] initWithItems:@[self.greendView]];
    collisionB.translatesReferenceBoundsIntoBoundary = YES;
    
    UIGravityBehavior *graB = [[UIGravityBehavior alloc] initWithItems:@[self.greendView]];
    
    [self.animator addBehavior:graB];
    [self.animator addBehavior:pushB];
    [self.animator addBehavior:collisionB];
    
}

@end
