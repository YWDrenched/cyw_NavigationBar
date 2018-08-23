//
//  LayerViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/20.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "LayerViewController.h"
#define WIDTH 50

@interface LayerViewController ()

@end

@implementation LayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addLayer];
}

-(void)addLayer{
    CALayer *layer = [[CALayer alloc] init];
    
    CGSize size=[UIScreen mainScreen].bounds.size;
//    设置layer位置
    layer.position = CGPointMake(size.width/2, size.height/2);
//    设置layer大小
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
//    设置圆弧，当为宽度一半时，则为圆形
    layer.cornerRadius = WIDTH / 2;
//    背景颜色
    layer.backgroundColor = [UIColor blueColor].CGColor;
//    阴影
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(10, 10);
    layer.shadowOpacity = .6;

    [self.view.layer addSublayer:layer];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CALayer *layer = self.view.layer.sublayers.firstObject;
    UITouch *touch = [touches anyObject];
    CGFloat width = layer.bounds.size.width;

    width==WIDTH ? (width = WIDTH * 4):(width = WIDTH);
    layer.position = [touch locationInView:self.view];
    layer.bounds = CGRectMake(0, 0, width, width);
    layer.cornerRadius = width / 2;
    
}

//-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    CALayer *layer = self.view.layer.sublayers.firstObject;
//    layer.position = [[touches anyObject] locationInView:self.view];
//}


@end
