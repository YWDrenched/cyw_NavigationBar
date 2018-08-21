//
//  Push_Transition.h
//  Demo
//
//  Created by 陈友文 on 2018/8/8.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Push_Transition : UIPercentDrivenInteractiveTransition

@property (nonatomic,assign)BOOL intreing;
-(void)writeToViewController:(UIViewController *)vc;

@end
