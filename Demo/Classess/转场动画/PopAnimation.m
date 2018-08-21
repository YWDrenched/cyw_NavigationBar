//
//  PopAnimation.m
//  Demo
//
//  Created by 陈友文 on 2018/8/8.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "PopAnimation.h"

@implementation PopAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 1.0f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *containView = [transitionContext containerView];
    [containView addSubview:toVC.view];
    UIView *tempView = containView.subviews.firstObject;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        fromVC.view.transform = CGAffineTransformIdentity;
        tempView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            toVC.view.hidden = NO;
            [tempView removeFromSuperview];
            NSLog(@"%d",toVC.view.hidden);
        }
    }];
    
    
    
    
    
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    UIView *containerView = [transitionContext containerView];
//    //拿到push时候的
//    UIView *tempView = containerView.subviews.lastObject;
//    [containerView addSubview:toVC.view];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        tempView.layer.transform = CATransform3DIdentity;
//        fromVC.view.subviews.lastObject.alpha = 1.0;
//        tempView.subviews.lastObject.alpha = 0.0;
//    } completion:^(BOOL finished) {
//        if ([transitionContext transitionWasCancelled]) {
//            [transitionContext completeTransition:NO];
//        }else{
//            [transitionContext completeTransition:YES];
//            [tempView removeFromSuperview];
//            toVC.view.hidden = NO;
//        }
//    }];
    
}

@end
