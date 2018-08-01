//
//  UINavigationBar+cyw_NavigationBar.h
//  Demo
//
//  Created by 陈友文 on 2018/7/31.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UINavigationBar (cyw_NavigationBar)

@property (nonatomic,strong)UIView *mask;

-(void)cyw_setNavgationBarColor:(UIColor *)color;

-(void)cyw_resetMask;

- (void)cyw_setTranslationY:(CGFloat)translationY;

-(void)cyw_setNavgationAlpha:(CGFloat)alpha;

@end
