//
//  TestView.m
//  Demo
//
//  Created by 陈友文 on 2018/8/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "TestView.h"





@implementation TestView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(void)setEnd:(CGPoint)end{
    _end = end;
    
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect{
 
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:self.start];
    
    [path addLineToPoint:self.end];
    
    [path stroke];
}



@end
