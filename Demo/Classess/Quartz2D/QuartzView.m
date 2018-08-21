//
//  QuartzView.m
//  Demo
//
//  Created by 陈友文 on 2018/8/21.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "QuartzView.h"

@implementation QuartzView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    //获取图形上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
//
////    创建路径对象
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, nil, 100, 200);
//    CGPathAddLineToPoint(path, nil, 100, 350);
//    CGPathAddLineToPoint(path, nil, 300, 350);
//    CGPathAddLineToPoint(path, nil, 100, 200);
//    CGContextSetShadow(context, CGSizeMake(2, 2), 1.0);
//
////    添加路径到图形上下文
//    CGContextAddPath(context, path);
//
////    设置图形上下文状态和属性
//    CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
//    CGContextSetRGBFillColor(context, 0, 1.0, 0, 1.0);
//    CGContextSetLineWidth(context, 2.0);
//
////    填充类型
//    CGContextDrawPath(context, kCGPathFillStroke);
//
////    释放图形向下文
//    CGPathRelease(path);
    
//    [self drawLine2];
    
//    绘制矩形
//    [self drawRectWitchContext:context];
//    绘制椭圆
//    [self drawEllipse:context];
//    绘制弧线
//    [self drawArc:context];
    
//    [self drawCurve];
    
//    [self drawPic];
    
//    [self drawLinearGradient:context];
    
//    [self drawRadialGradient:context];
    
    [self drawImage2];
}


//CGContext封装简单绘图
-(void)drawLine2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 200, 100);
    CGContextAddLineToPoint(context, 200, 300);
    CGContextAddLineToPoint(context, 400, 300);
    
    CGContextClosePath(context);
    
    [[UIColor orangeColor] setFill];
    [[UIColor redColor] setStroke];

    
    CGContextDrawPath(context, kCGPathFillStroke);
}

//    绘制矩形
-(void)drawRectWitchContext:(CGContextRef)context{
    CGRect rect = CGRectMake(50, 100, 200, 100);
    
    CGContextAddRect(context, rect);
    [[UIColor redColor] set];
    
    CGContextDrawPath(context, kCGPathFillStroke);
}


//绘制椭圆
-(void)drawEllipse:(CGContextRef)context{
    CGContextAddEllipseInRect(context, CGRectMake(100, 100, 200, 200));
    [[UIColor greenColor] setFill];
    CGContextDrawPath(context, kCGPathFill);
}

//    绘制弧线
-(void)drawArc:(CGContextRef)context{
    CGContextAddArc(context, 200, 300, 100, 0, M_PI, 1);
    [[UIColor redColor] set];
    CGContextDrawPath(context, kCGPathStroke);
}

//绘制贝塞尔曲线
-(void)drawCurve{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, 200, 300);
    
    CGContextAddQuadCurveToPoint(context, 160, 0, 300, 100);
    [[UIColor redColor] setFill];
    [[UIColor greenColor] setStroke];
    CGContextDrawPath(context, kCGPathFillStroke);
}




//图像绘制
-(void)drawPic{
//    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIImage *image = [UIImage imageNamed:@"img02"];
//    从区域绘制
//    [image drawInRect:CGRectMake(10, 50, 300, 450)];
//    从点开始绘制
    [image drawAtPoint:CGPointMake(100, 200)];
    
}


#pragma mark 径向渐变
-(void)drawRadialGradient:(CGContextRef)context{
    //使用rgb颜色空间
    CGColorSpaceRef colorSpace=CGColorSpaceCreateDeviceRGB();
    
    /*指定渐变色
     space:颜色空间
     components:颜色数组,注意由于指定了RGB颜色空间，那么四个数组元素表示一个颜色（red、green、blue、alpha），
     如果有三个颜色则这个数组有4*3个元素
     locations:颜色所在位置（范围0~1），这个数组的个数不小于components中存放颜色的个数
     count:渐变个数，等于locations的个数
     */
    CGFloat compoents[12]={
        248.0/255.0,86.0/255.0,86.0/255.0,1,
        249.0/255.0,127.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat locations[3]={0,0.3,1.0};
    CGGradientRef gradient= CGGradientCreateWithColorComponents(colorSpace, compoents, locations, 3);
    
    /*绘制径向渐变
     context:图形上下文
     gradient:渐变色
     startCenter:起始点位置
     startRadius:起始半径（通常为0，否则在此半径范围内容无任何填充）
     endCenter:终点位置（通常和起始点相同，否则会有偏移）
     endRadius:终点半径（也就是渐变的扩散长度）
     options:绘制方式,kCGGradientDrawsBeforeStartLocation 开始位置之前就进行绘制，但是到结束位置之后不再绘制，
     kCGGradientDrawsAfterEndLocation开始位置之前不进行绘制，但到结束点之后继续填充
     */
    CGContextDrawRadialGradient(context, gradient, CGPointMake(160, 284),0, CGPointMake(165, 289), 150, kCGGradientDrawsAfterEndLocation);
    //释放颜色空间
    CGColorSpaceRelease(colorSpace);
}

//绘制渐变色
-(void)drawLinearGradient:(CGContextRef)context{
    CGColorSpaceRef colorRef = CGColorSpaceCreateDeviceRGB();
    
    CGFloat compoents[12] = {
        248.0/255.0,86.0/255.0,186.0/255.0,1,
        249.0/255.0,27.0/255.0,127.0/255.0,1,
        1.0,1.0,1.0,1.0
    };
    CGFloat location[3] = {0,0.5,1.0};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(colorRef, compoents, location, 3);
    CGContextDrawLinearGradient(context, gradient, CGPointZero, CGPointMake(375,667), kCGGradientDrawsAfterEndLocation);
    CGColorSpaceRelease(colorRef);
}


//Core Image绘制图片
//因为坐标系的y轴是反的，所以绘制出来的图片是倒的
-(void)drawImage2{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGContextScaleCTM(context, 1.0, -1.0);//在y轴缩放-1相当于沿着x张旋转180
    CGContextTranslateCTM(context, 0, -400);
    CGContextDrawImage(context, CGRectMake(20, 80, 300, 400), [UIImage imageNamed:@"img01"].CGImage);
    CGContextRestoreGState(context);
}





@end
