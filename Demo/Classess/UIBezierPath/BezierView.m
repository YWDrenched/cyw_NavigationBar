//
//  BezierView.m
//  Demo
//
//  Created by 陈友文 on 2018/8/22.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "BezierView.h"

@interface BezierView()

@property (nonatomic,strong)UIBezierPath *path;
@end

@implementation BezierView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
   
    
//    [self setNeedsDisplay];
    [self draw05];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.path = [UIBezierPath bezierPath];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
        pan.minimumNumberOfTouches = pan.maximumNumberOfTouches = 1;
        [self addGestureRecognizer:pan];
    }
    return self;
}

//绘制矩形
-(void)draw01{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(200, 200, 200, 200)];
    [path setLineWidth:5];
    [[UIColor redColor] setFill];
    [[UIColor greenColor] setStroke];
    [path fill];
    [path stroke];
}

-(void)draw02{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [path fill];
    
}

-(void  )draw03{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 300)];
    [path addLineToPoint:CGPointMake(300, 300)];
    [path addLineToPoint:CGPointMake(100, 400)];
    [path addLineToPoint:CGPointMake(100, 300)];
    
    [path setLineWidth:10];
    [path setLineCapStyle:kCGLineCapRound];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path stroke];
    [path closePath];
}

-(void)draw04{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
//    [path addQuadCurveToPoint:CGPointMake(200, 200) controlPoint:CGPointMake(100, 200)];
    
    [path addCurveToPoint:CGPointMake(350, 250) controlPoint1:CGPointMake(310, 200) controlPoint2:CGPointMake(210, 400)];
    [path stroke];
}

-(void)draw05{
    [[UIColor greenColor] setStroke];
    [self.path stroke];
}

-(void)panGes:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self.path moveToPoint:point];
    }else if (pan.state == UIGestureRecognizerStateChanged){
        [self.path addLineToPoint:point];
    }
    
    [self setNeedsDisplay];
}


static CGPoint midpoint(CGPoint p0, CGPoint p1) {
    return (CGPoint) {
        (p0.x + p1.x) / 2.0,
        (p0.y + p1.y) / 2.0
    };
}
@end
