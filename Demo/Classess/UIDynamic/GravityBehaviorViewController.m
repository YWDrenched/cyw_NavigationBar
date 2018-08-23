//
//  GravityBehaviorViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "GravityBehaviorViewController.h"
#import "BezierView.h"

@interface GravityBehaviorViewController ()

@property (nonatomic,strong)UIDynamicAnimator *animator;

@property (nonatomic,strong)UIView *greendView;

@property (nonatomic,strong)UIView *blueView;

@end

@implementation GravityBehaviorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //初始化动画者
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    // 创建重力行为
    UIGravityBehavior *behavior = [[UIGravityBehavior alloc] initWithItems:@[self.greendView]];
    //重力等级
    behavior.magnitude = 2;
    //重力方向
//    behavior.angle = M_PI_4;
    
    // 创建碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.greendView]];
//    开启边缘检测
    collision.translatesReferenceBoundsIntoBoundary = YES;

    //添加行为
    [self.animator addBehavior:behavior];
    [self.animator addBehavior:collision];
    
}
-(UIView *)greendView{
    if (!_greendView) {
        _greendView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _greendView.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_greendView];
    }
    return _greendView;
}
@end
