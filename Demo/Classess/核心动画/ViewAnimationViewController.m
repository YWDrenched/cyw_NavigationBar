//
//  ViewAnimationViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/21.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "ViewAnimationViewController.h"

@interface ViewAnimationViewController ()

@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"叶子"]];
    imageView.frame = CGRectMake(100, 200, 30, 30);
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = touches.anyObject;
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveLinear animations:^{
        self.imageView.center = [touch locationInView:self.view];
    } completion:^(BOOL finished) {
        
    }];
}


@end
