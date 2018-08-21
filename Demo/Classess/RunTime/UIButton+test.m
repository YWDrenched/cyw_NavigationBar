//
//  UIButton+test.m
//  Demo
//
//  Created by 陈友文 on 2018/8/6.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "UIButton+test.h"
#import <objc/runtime.h>
static unsigned int num = 0;
@implementation UIButton (test)


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method oriMethod = class_getInstanceMethod(self.class, @selector(sendAction:to:forEvent:));
        Method cusMethod = class_getInstanceMethod(self.class, @selector(customSendAction:to:forEvent:));
        // 判断自定义的方法是否实现, 避免崩溃
        BOOL addSuccess = class_addMethod(self.class, @selector(sendAction:to:forEvent:), method_getImplementation(cusMethod), method_getTypeEncoding(cusMethod));
        if (addSuccess) {
            // 没有实现, 将源方法的实现替换到交换方法的实现
            class_replaceMethod(self.class, @selector(customSendAction:to:forEvent:), method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
        } else {
            // 已经实现, 直接交换方法
            method_exchangeImplementations(oriMethod, cusMethod);
        }
    });
}

-(void)customSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    num ++;
    NSLog(@"点击了%d次",num);
    [self customSendAction:action to:target forEvent:event];
}
@end
