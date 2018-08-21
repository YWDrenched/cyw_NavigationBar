//
//  GruopViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/20.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "GruopViewController.h"

@interface GruopViewController ()
@property (nonatomic,strong)CALayer *layer;

@end

@implementation GruopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.layer = [[CALayer alloc] init];
    self.layer.position = CGPointMake(200, 100);
    self.layer.bounds = CGRectMake(0, 0, 30, 30);
    self.layer.contents = (id)[UIImage imageNamed:@"叶子"].CGImage;
    [self.view.layer addSublayer:self.layer];
    
    [self groupAnimation];
}

-(CABasicAnimation *)baseAnimation{
    CABasicAnimation *basicAnimation=[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    CGFloat toValue=M_PI_2*3;
    basicAnimation.toValue=[NSNumber numberWithFloat:M_PI_2*3];
    
    //    basicAnimation.duration=6.0;
    basicAnimation.autoreverses=true;
    basicAnimation.repeatCount=HUGE_VALF;
    basicAnimation.removedOnCompletion=NO;
    
    [basicAnimation setValue:[NSNumber numberWithFloat:toValue] forKey:@"KCBasicAnimationProperty_ToValue"];
    
    return basicAnimation;
}

-(CAKeyframeAnimation *)keyAnimation{
    CAKeyframeAnimation *keyAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *key1=[NSValue valueWithCGPoint:_layer.position];//对于关键帧动画初始值不能省略
    NSValue *key2=[NSValue valueWithCGPoint:CGPointMake(300, 320)];
    NSValue *key3=[NSValue valueWithCGPoint:CGPointMake(200, 490)];
    NSValue *key4=[NSValue valueWithCGPoint:CGPointMake(370, 660)];
    keyAnim.values =@[key1,key2,key3,key4];
    keyAnim.duration = 8;
    
    return keyAnim;
}


-(void)groupAnimation{
    CAAnimationGroup *gruop = [CAAnimationGroup animation];
    CAKeyframeAnimation *keyAnim = [self keyAnimation];
    CABasicAnimation *basicAnim = [self baseAnimation];
    gruop.animations = @[keyAnim,basicAnim];
    gruop.duration = 8;
    [self.layer addAnimation:gruop forKey:nil];
}



@end
