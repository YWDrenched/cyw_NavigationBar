//
//  PresentAnimation.m
//  Demo
//
//  Created by 陈友文 on 2018/8/7.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "PresentAnimation.h"

@implementation PresentAnimation




- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    // 1. Get controllers from transition context
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    fromView.frame = fromVC.view.frame;
    fromVC.view.hidden = YES;

    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:fromView];
    [containerView addSubview:toVC.view];
    toVC.view.frame = CGRectMake(0, screenBounds.size.height, screenBounds.size.width,400);
    
    // 4. Do animate now
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    [UIView animateWithDuration:duration
                          delay:0.0
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         toVC.view.transform =  CGAffineTransformMakeTranslation(0, -400);
                         fromView.transform = CGAffineTransformMakeScale(0.85, 0.85);
                     } completion:^(BOOL finished) {
                         // 5. Tell context that we completed.
                         [transitionContext completeTransition:YES];
                     }];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.8f;
}

@end
