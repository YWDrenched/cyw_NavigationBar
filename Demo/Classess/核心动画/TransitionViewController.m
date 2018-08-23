//
//  TransitionViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/20.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "TransitionViewController.h"

@interface TransitionViewController ()
@property (nonatomic,strong)UIImageView *imageView;

@property(nonatomic,assign)int index;

@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //定义图片控件
    _imageView=[[UIImageView alloc]init];
    _imageView.frame=[UIScreen mainScreen].bounds;
    _imageView.contentMode=UIViewContentModeScaleAspectFit;
    _imageView.image=[UIImage imageNamed:@"img01"];//默认图片
    [self.view addSubview:_imageView];
    //添加手势
    UISwipeGestureRecognizer *leftSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    leftSwipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwipeGesture];
    
    UISwipeGestureRecognizer *rightSwipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    rightSwipeGesture.direction=UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwipeGesture];
    
}


#pragma mark 向左滑动浏览下一张图片
-(void)leftSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:YES];
}

#pragma mark 向右滑动浏览上一张图片
-(void)rightSwipe:(UISwipeGestureRecognizer *)gesture{
    [self transitionAnimation:NO];
}

#pragma mark 转场动画
-(void)transitionAnimation:(BOOL)isNext{
    CATransition *transition = [[CATransition alloc] init];
    
    transition.type = @"cube";
   
    isNext?(transition.subtype = kCATransitionFromRight):(transition.subtype = kCATransitionFromLeft);
    
    transition.duration = .4f;
    self.imageView.image = [self getImage:isNext];
    [self.imageView.layer addAnimation:transition forKey:nil];
    
}

#pragma mark 取得当前图片
-(UIImage *)getImage:(BOOL)isNext{

    isNext?(self.index = self.index+1):(self.index = self.index-1);
    
    return [UIImage imageNamed:[NSString stringWithFormat:@"img0%d",self.index]];
}



@end
