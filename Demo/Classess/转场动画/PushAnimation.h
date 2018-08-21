//
//  PushAnimation.h
//  Demo
//
//  Created by 陈友文 on 2018/8/8.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PushAnimationType) {
    PushAnimationTypePush,
    PushAnimationTypePop
};

@interface PushAnimation : NSObject<UIViewControllerAnimatedTransitioning>


//+(instancetype)transitionWithType:(PushAnimationType)type;
@end
