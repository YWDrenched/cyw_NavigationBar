//
//  KeyAnimationViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/20.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "KeyAnimationViewController.h"

@interface KeyAnimationViewController ()
@property (nonatomic,strong)CALayer *layer;

@end

@implementation KeyAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.layer = [[CALayer alloc] init];
    self.layer.bounds = CGRectMake(0, 0, 30, 30);
    self.layer.position = CGPointMake(200, 100);
    self.layer.contents =(id) [UIImage imageNamed:@"叶子"].CGImage;
    self.layer.anchorPoint = CGPointMake(0.5, 0.6);
    [self.view.layer addSublayer:self.layer];
    [self creatKeyAnmition];
}

-(void)creatKeyAnmition{
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:self.layer.position];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(300, 200)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(200, 350)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(300, 450)];
    
    keyAnimation.values = @[value1,value2,value3,value4];
    keyAnimation.duration = 5;
    [self.layer addAnimation:keyAnimation forKey:@"KCKeyframeAnimation_Position"];
    
    
}

@end
