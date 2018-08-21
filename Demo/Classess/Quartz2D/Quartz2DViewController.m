//
//  Quartz2DViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/21.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "Quartz2DViewController.h"
#import "QuartzView.h"

@interface Quartz2DViewController ()
@property (nonatomic,strong)NSArray *dataArr;

@property (nonatomic,strong)NSArray *titleArr;


@end

@implementation Quartz2DViewController

//-(NSArray *)dataArr{
//    if (!_dataArr) {
//        _dataArr = @[];
//    }
//    return _dataArr;
//}
//
//-(NSArray *)titleArr{
//    if (!_titleArr ) {
//        _titleArr = @[];
//    }
//    return _titleArr;
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    QuartzView *view = [[QuartzView alloc] initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];

    
    UIImage *image = [self drawImageAtImageContext];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.center=CGPointMake(160, 284);
    
    [self.view addSubview:imageView];
}

//添加水印
-(UIImage *)drawImageAtImageContext{
    //获得一个位图图形上下文
    CGSize size=CGSizeMake(300, 188);//画布大小
    UIGraphicsBeginImageContext(size);
    
    UIImage *image=[UIImage imageNamed:@"img03.png"];
    [image drawInRect:CGRectMake(0, 0, 300, 188)];//注意绘图的位置是相对于画布顶点而言，不是屏幕
    
    
    //添加水印
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 200, 178);
    CGContextAddLineToPoint(context, 270, 178);
    
    [[UIColor redColor]setStroke];
    CGContextSetLineWidth(context, 2);
    
    CGContextDrawPath(context, kCGPathStroke);
    
    NSString *str=@"Drenched";
    [str drawInRect:CGRectMake(200, 158, 100, 30) withAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Marker Felt" size:15],NSForegroundColorAttributeName:[UIColor redColor]}];
    
    //返回绘制的新图形
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    //最后一定不要忘记关闭对应的上下文
    UIGraphicsEndImageContext();
    
    //保存图片
    //    NSData *data= UIImagePNGRepresentation(newImage);
    //    [data writeToFile:@"/Users/kenshincui/Desktop/myPic.png" atomically:YES];
    
    return newImage;
}


@end
