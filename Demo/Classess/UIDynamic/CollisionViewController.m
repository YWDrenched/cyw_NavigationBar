//
//  CollisionViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "CollisionViewController.h"
#import "TestView.h"

@interface CollisionViewController ()
@property (nonatomic,strong)UIDynamicAnimator *animator;

@property (nonatomic,strong)UIView *greendView;

@property (nonatomic,strong)UIView *blueView;
@end

@implementation CollisionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    TestView *testView = [[TestView alloc] initWithFrame:self.view.bounds];
    testView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:testView];
    
    _blueView = [[UIView alloc] initWithFrame:CGRectMake(120, 250, 80, 80)];
    _blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_blueView];
    
    _greendView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _greendView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_greendView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *graBehavoir = [[UIGravityBehavior alloc] initWithItems:@[self.greendView]];
    
    UICollisionBehavior *collBehavoir = [[UICollisionBehavior alloc] initWithItems:@[self.greendView,self.blueView]];
    //碰撞模式
    //    UICollisionBehaviorModeItems        元素与元素之间发生碰撞 (跟边界不碰撞）
    //    UICollisionBehaviorModeBoundaries   元素与边界发生碰撞 （与元素不碰撞）
    //    UICollisionBehaviorModeEverything   元素、边界都碰撞 （默认）
    collBehavoir.collisionMode = UICollisionBehaviorModeEverything;
    collBehavoir.translatesReferenceBoundsIntoBoundary = YES;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(230, 370) radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
    [collBehavoir addBoundaryWithIdentifier:@"ID" forPath:path];
    
    //动力学元素自身的行为
    UIDynamicItemBehavior *itemBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[self.greendView]];
    itemBehavior.elasticity = 0.8;
    itemBehavior.friction = 0.1;
    
    [self.animator addBehavior:graBehavoir];
    [self.animator addBehavior:collBehavoir];
    [self.animator addBehavior:itemBehavior];
    
}

@end
