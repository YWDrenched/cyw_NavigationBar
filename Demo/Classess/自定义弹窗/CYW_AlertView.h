//
//  CYW_AlertView.h
//  01-封装弹窗视图
//
//  Created by 陈友文 on 2018/7/16.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CYW_AlertView;

//typedef void(^DetailClickCompletion)(NSString *msgStr);

typedef void(^ComfirClickCompletion)(NSString *msgStr);

typedef NS_ENUM(NSInteger, AlertViewType) {
    AlertViewTypeDefault,
    AlertViewTypeDetail,
};

@interface CYW_AlertView : UIView

@property (nonatomic,copy)NSString *titleStr;

@property (nonatomic,copy)NSString *msgStr;

@property (nonatomic,strong)UIColor *backgroundColor;

@property (nonatomic,strong)UIColor *buttonColor;


//@property (nonatomic,assign)BOOL animation;

//@property (nonatomic,copy)DetailClickCompletion detailCompletion;

@property (nonatomic,copy)ComfirClickCompletion comfirmCompletion;





+(instancetype)showAddView:(UIView *)view withTitleStr:(NSString *)titleStr withMsgStr:(NSString *)msgStr;

+(instancetype)showAddView:(UIView *)view withTitleStr:(NSString *)titleStr withMsgStr:(NSString *)msgStr withType:(AlertViewType)type;

-(void)removeAlertView;
@end
