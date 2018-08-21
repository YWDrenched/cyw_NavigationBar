//
//  DismissAnimation.m
//  Demo
//
//  Created by 陈友文 on 2018/8/8.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "DismissAnimation.h"

@implementation DismissAnimation



- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    
    UIView *containerView = [transitionContext containerView];
    NSArray *subviewsArray = containerView.subviews;
    UIView *tempView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 2))];
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
        tempView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            fromVC.view.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
    
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    //参照present动画的逻辑，present成功后，containerView的最后一个子视图就是截图视图，我们将其取出准备动画
//    UIView *containerView = [transitionContext containerView];
//    NSArray *subviewsArray = containerView.subviews;
//    UIView *tempView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 2))];
//    //动画吧
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        //因为present的时候都是使用的transform，这里的动画只需要将transform恢复就可以了
//        fromVC.view.transform = CGAffineTransformIdentity;
//        tempView.transform = CGAffineTransformIdentity;
//    } completion:^(BOOL finished) {
//        if ([transitionContext transitionWasCancelled]) {
//            //失败了接标记失败
//            [transitionContext completeTransition:NO];
//        }else{
//            //如果成功了，我们需要标记成功，同时让vc1显示出来，然后移除截图视图，
//            [transitionContext completeTransition:YES];
//            toVC.view.hidden = NO;
//            [tempView removeFromSuperview];
//        }
//    }];

}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
   return 0.8f;
    
}


@end
