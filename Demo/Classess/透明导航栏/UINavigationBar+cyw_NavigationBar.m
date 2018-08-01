//
//  UINavigationBar+cyw_NavigationBar.m
//  Demo
//
//  Created by 陈友文 on 2018/7/31.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "UINavigationBar+cyw_NavigationBar.h"

@implementation UINavigationBar (cyw_NavigationBar)

-(void)setMask:(UIView *)mask{
    objc_setAssociatedObject(self, @selector(mask), mask, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)mask{
    return objc_getAssociatedObject(self, @selector(mask));
}

-(void)cyw_setNavgationBarColor:(UIColor *)color{
    if (!self.mask) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        self.mask = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64)];
        self.mask.userInteractionEnabled = NO;
        self.mask.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self insertSubview:self.mask atIndex:0];
    }
    self.mask.backgroundColor = color;
}

//-(void)listProperty{
//    unsigned int count = 0;
//    objc_property_t *pArr = class_copyPropertyList([self class], &count);
//    for (NSInteger i = 0; i < count; i++) {
//        const char *pName = property_getName(pArr[i]);
//        NSString *name = [NSString stringWithUTF8String:pName];
//        NSLog(@" property = %@",name);
//        if ([name isEqualToString:@"_backgroundView"]) {
//            UIView *view = [self valueForKey:@"_UINavigationBarContentView"];
//            for (UIView *v in view.subviews) {
//                NSLog(@"view = %@",v);
//            }
//        }
//    }
//}

- (void)cyw_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}


-(void)cyw_setNavgationAlpha:(CGFloat)alpha{
    if (@available(iOS 11.0,*)) {
        [[self subviews] enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
                
                for (UIView *view in [obj subviews])
                {
                    view.alpha = alpha;
                }
            }
        }];
    }else{
        [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
            view.alpha = alpha;
        }];
        
        [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
            view.alpha = alpha;
        }];
        
        
        UIView *titleView = [self valueForKey:@"_titleView"];
        titleView.alpha = alpha;
        //    when viewController first load, the titleView maybe nil
        [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
            if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
                obj.alpha = alpha;
            }
            if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {
                obj.alpha = alpha;
            }
        }];
    }
}

-(void)cyw_resetMask{
    if (self.mask) {
        [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.mask removeFromSuperview];
        self.mask = nil;
    }
}

@end
