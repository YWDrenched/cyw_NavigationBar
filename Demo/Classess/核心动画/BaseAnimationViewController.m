//
//  BaseAnimationViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/20.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "BaseAnimationViewController.h"

@interface BaseAnimationViewController ()<CAAnimationDelegate>
@property (nonatomic,strong)CALayer *layer;

@end

@implementation BaseAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self animation];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)animation{
    self.layer = [[CALayer alloc] init];
    self.layer.bounds = CGRectMake(0, 0, 30, 30);
    self.layer.position = CGPointMake(200, 100);
    self.layer.contents =(id) [UIImage imageNamed:@"叶子"].CGImage;
    self.layer.anchorPoint = CGPointMake(0.5, 0.6);
    [self.view.layer addSublayer:self.layer];
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    [self moveToPoint:point];
    [self rotationAnimation];
}

// 移动动画
-(void)moveToPoint:(CGPoint)point{
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    basicAnimation.duration = 5;
    basicAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    basicAnimation.toValue = [NSValue valueWithCGPoint:point];
    basicAnimation.delegate = self;
    // 将终点存储起来
    [basicAnimation setValue:[NSValue valueWithCGPoint:point] forKey:@"animationStop"];
//    添加动画并给动画命名，后面可以通过名字获取动画
    [self.layer addAnimation:basicAnimation forKey:@"KCBasicAnimation_Translation"];
}

//旋转动画
-(void)rotationAnimation{
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.duration = 5;
    anim.toValue = [NSNumber numberWithDouble:M_PI * 3];
    anim.repeatCount = MAXFLOAT;
    anim.removedOnCompletion = NO;
    [self.layer addAnimation:anim forKey:@"KCBasicAnimation_Rotation"];
}




-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //开启事务
    [CATransaction begin];
    //禁用隐式动画
    [CATransaction setDisableActions:YES];
//    将图层移动到终点
    self.layer.position = [[anim valueForKey:@"animationStop"] CGPointValue];
    
   
     //提交事务
    [CATransaction commit];
}



@end
