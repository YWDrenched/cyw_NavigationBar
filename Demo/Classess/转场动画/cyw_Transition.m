//
//  cyw_Transition.m
//  Demo
//
//  Created by 陈友文 on 2018/8/8.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "cyw_Transition.h"
@interface cyw_Transition()
@property (nonatomic,assign)BOOL isCompltion;
@property (nonatomic,strong)UIViewController *presentingVC;

@end

@implementation cyw_Transition

-(void)writeToViewController:(UIViewController *)vc{
    self.presentingVC = vc;
    [self prepareGestureRecognizerInView:vc.view];
}

- (void)prepareGestureRecognizerInView:(UIView*)view {
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [view addGestureRecognizer:gesture];
}

-(void)handleGesture:(UIPanGestureRecognizer *)ges{
    CGPoint point = [ges translationInView:ges.view.superview];
    NSLog(@"%@",NSStringFromCGPoint(point));
    switch (ges.state) {
        case UIGestureRecognizerStateBegan:
            self.intreing = YES;
            [self.presentingVC dismissViewControllerAnimated:YES completion:nil];
           
            break;
        case UIGestureRecognizerStateChanged:{
            CGFloat precent = point.y / 400;
            precent = MIN(MAX(0, precent), 1);
            self.isCompltion =  precent > 0.5;
            
            [self updateInteractiveTransition:precent];
            break;
        }
            
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
            self.intreing = NO;
            if (!self.isCompltion || ges.state == UIGestureRecognizerStateCancelled) {
                [self cancelInteractiveTransition];
            }else{
                [self finishInteractiveTransition];
            }
            
            break;
        }
            
            
        default:
            break;
    }
}

@end
