//
//  PushAnimation.m
//  Demo
//
//  Created by 陈友文 on 2018/8/8.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "PushAnimation.h"
#import "UIView+anchorPoint.h"
@interface PushAnimation()

@property (nonatomic,assign)PushAnimationType type;
@end

@implementation PushAnimation

//+(instancetype)transitionWithType:(PushAnimationType)type{
//    return [[self alloc] initWithAnimation:type];
//}

//-(instancetype)initWithAnimation:(PushAnimationType)type{
//    if (self = [super init]) {
//        _type = type;
//    }
//    return self;
//}
//
- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    toVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);

    UIView *containViow = [transitionContext containerView];
    [containViow addSubview:tempView];
    [containViow addSubview:toVC.view];
    fromVC.view.hidden = YES;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        tempView.transform = CGAffineTransformMakeRotation(M_PI);
//        tempView.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width / 3, 0);
        toVC.view.transform = CGAffineTransformMakeTranslation(-[UIScreen mainScreen].bounds.size.width, 0);

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            [tempView removeFromSuperview];
            fromVC.view.hidden = NO;
        }
    }];
    
    
    
    
    
    
    
//    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//    //对tempView做动画，避免bug;
//    UIView *tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
//    tempView.frame = fromVC.view.frame;
//    UIView *containerView = [transitionContext containerView];
//    [containerView addSubview:toVC.view];
//    [containerView addSubview:tempView];
//    fromVC.view.hidden = YES;
//    [containerView insertSubview:toVC.view atIndex:0];
//    [tempView setAnchorPointTo:CGPointMake(0, 0.5)];
//    CATransform3D transfrom3d = CATransform3DIdentity;
//    transfrom3d.m34 = -0.002;
//    containerView.layer.sublayerTransform = transfrom3d;
//    //增加阴影
//    CAGradientLayer *fromGradient = [CAGradientLayer layer];
//    fromGradient.frame = fromVC.view.bounds;
//    fromGradient.colors = @[(id)[UIColor blackColor].CGColor,
//                            (id)[UIColor blackColor].CGColor];
//    fromGradient.startPoint = CGPointMake(0.0, 0.5);
//    fromGradient.endPoint = CGPointMake(0.8, 0.5);
//    UIView *fromShadow = [[UIView alloc]initWithFrame:fromVC.view.bounds];
//    fromShadow.backgroundColor = [UIColor clearColor];
//    [fromShadow.layer insertSublayer:fromGradient atIndex:1];
//    fromShadow.alpha = 0.0;
//    [tempView addSubview:fromShadow];
//    CAGradientLayer *toGradient = [CAGradientLayer layer];
//    toGradient.frame = fromVC.view.bounds;
//    toGradient.colors = @[(id)[UIColor blackColor].CGColor,
//                          (id)[UIColor blackColor].CGColor];
//    toGradient.startPoint = CGPointMake(0.0, 0.5);
//    toGradient.endPoint = CGPointMake(0.8, 0.5);
//    UIView *toShadow = [[UIView alloc]initWithFrame:fromVC.view.bounds];
//    toShadow.backgroundColor = [UIColor clearColor];
//    [toShadow.layer insertSublayer:toGradient atIndex:1];
//    toShadow.alpha = 1.0;
//    [toVC.view addSubview:toShadow];
//    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
//        tempView.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);
//        fromShadow.alpha = 1.0;
//        toShadow.alpha = 0.0;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        if ([transitionContext transitionWasCancelled]) {
//            [tempView removeFromSuperview];
//            fromVC.view.hidden = NO;
//        }
//    }];

}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0f;
}





@end
