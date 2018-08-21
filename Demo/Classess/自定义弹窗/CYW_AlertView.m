//
//  CYW_AlertView.m
//  01-封装弹窗视图
//
//  Created by 陈友文 on 2018/7/16.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "CYW_AlertView.h"
#import <Masonry.h>

#define k_screenWidth [UIScreen mainScreen].bounds.size.width
#define k_screenHeight [UIScreen mainScreen].bounds.size.height
//rgb
#define Alert_RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

@interface CYW_AlertView()

@property (nonatomic,strong)UIView *backgroundView;

@property (nonatomic,strong)UIView *containView;

@property (nonatomic,strong)UIButton *comfirmBtn;

@property (nonatomic,strong)UIButton *cancleBtn;

@property (nonatomic,strong)UIButton *detailBtn;

@property (nonatomic,strong)UILabel *titleLabel;

@property (nonatomic,strong)UILabel *msgLabel;


@property (nonatomic,assign)AlertViewType type;
@end

@implementation CYW_AlertView

+(instancetype)showAddView:(UIView *)view withTitleStr:(NSString *)titleStr withMsgStr:(NSString *)msgStr {
    
    return [CYW_AlertView showAddView:view withTitleStr:titleStr withMsgStr:msgStr withType:AlertViewTypeDefault];
}


+(instancetype)showAddView:(UIView *)view withTitleStr:(NSString *)titleStr withMsgStr:(NSString *)msgStr withType:(AlertViewType)type{
    CYW_AlertView *alertView = [[self alloc]initWithView:view];
    
    alertView.type = type;
    alertView.titleStr = titleStr;
    alertView.msgStr = msgStr;
    [view addSubview:alertView];
    
    return alertView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;

        [self setupUI];
        [self startAnimation];
    }
    return self;
}




-(void)setupUI{
    [self addSubview:self.backgroundView];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.containView);
        make.top.mas_equalTo(self.containView);
        make.height.mas_equalTo(40);
    }];
    
    [self.msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.containView);
        make.left.mas_equalTo(self.containView).mas_offset(10);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).mas_offset(10);
    }];
    
    [self.comfirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.containView);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(self.containView);
        make.width.mas_equalTo(self.bounds.size.width / 2);
    }];
    
    [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.containView);
        make.height.mas_equalTo(40);
        make.bottom.mas_equalTo(self.containView);
        make.width.mas_equalTo(self.bounds.size.width / 2);
    }];
    
    
}

-(void)startAnimation{
    __weak typeof(self)weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.containView.transform = CGAffineTransformIdentity;
    }];
}

-(UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] init];
        _backgroundView.frame = self.frame;
        _backgroundView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        [_backgroundView addSubview:self.containView];
    }
    return _backgroundView;
}

-(UIView *)containView{
    if (!_containView) {
        _containView = [[UIView alloc] init];
        CGFloat w = self.frame.size.width - 60;
        _containView.frame = CGRectMake(0, 0,w, w - 100);
        _containView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        _containView.layer.cornerRadius = 5;
        _containView.clipsToBounds = YES;
        _containView.center = self.backgroundView.center;
        _containView.backgroundColor = Alert_RGBA(223, 223, 223, 1);
        [_containView addSubview:self.titleLabel];
        [_containView addSubview:self.msgLabel];
        [_containView addSubview:self.comfirmBtn];
        [_containView addSubview:self.cancleBtn];
       
    }
    return _containView;
}
-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:25];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

-(UILabel *)msgLabel{
    if (!_msgLabel) {
        _msgLabel = [[UILabel alloc] init];
        _msgLabel.font = [UIFont systemFontOfSize:16];
        _msgLabel.numberOfLines = 0;
        _msgLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _msgLabel;
}

-(UIButton *)comfirmBtn{
    if (!_comfirmBtn) {
        _comfirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_comfirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_comfirmBtn setBackgroundColor:[UIColor blueColor]];
        [_comfirmBtn addTarget:self action:@selector(comfirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_comfirmBtn setTitleColor:Alert_RGBA(244, 244, 244, 1) forState:UIControlStateNormal];
        _comfirmBtn.backgroundColor = Alert_RGBA(164, 196, 213, 1);
        
    }
    return _comfirmBtn;
}

-(UIButton *)cancleBtn{
    if (!_cancleBtn) {
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleBtn setBackgroundColor:[UIColor blueColor]];
        [_cancleBtn addTarget:self action:@selector(cancleBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_cancleBtn setTitleColor:Alert_RGBA(244, 244, 244, 1) forState:UIControlStateNormal];
        _cancleBtn.backgroundColor = Alert_RGBA(164, 196, 213, 1);
  
    }
    return _cancleBtn;
}

-(UIButton *)detailBtn{
    if (!_detailBtn) {
        _detailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_detailBtn setTitle:@"查看详情" forState:UIControlStateNormal];
        [_detailBtn setBackgroundColor:[UIColor blueColor]];
        [_detailBtn addTarget:self action:@selector(detailBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_detailBtn setTitleColor:Alert_RGBA(244, 244, 244, 1) forState:UIControlStateNormal];
        _detailBtn.backgroundColor = Alert_RGBA(164, 196, 213, 1);
    }
    return _detailBtn;
}


-(void)comfirmBtnClick{
    NSLog(@"确定");
    [self removeAlertView];
    if (self.comfirmCompletion) {
        self.comfirmCompletion(self.msgStr);
    }
}

-(void)cancleBtnClick{
    [self removeAlertView];
}

-(void)detailBtnClick{
    NSLog(@"点击详情");
    [self removeAlertView];
//    if (self.detailCompletion) {
//        self.detailCompletion(self.msgStr);
//    }
    
    if (self.comfirmCompletion) {
        self.comfirmCompletion(self.msgStr);
    }
}






-(instancetype)initWithView:(UIView *)view{
    return [self initWithFrame:view.bounds];
}

-(void)setType:(AlertViewType)type{
    _type = type;
    if (self.type == AlertViewTypeDetail) {
        [_containView addSubview:self.detailBtn];
        [self.cancleBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.containView);
            make.height.mas_equalTo(35);
            make.left.right.mas_equalTo(self.containView);
        }];
        
        [self.comfirmBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.cancleBtn.mas_top);
            make.height.mas_equalTo(35);
            make.left.right.mas_equalTo(self.containView);
        }];
        
        [self.detailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.comfirmBtn.mas_top);
            make.height.mas_equalTo(35);
            make.left.right.mas_equalTo(self.containView);
        }];
    }
}

-(void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

-(void)setMsgStr:(NSString *)msgStr{
    _msgStr = msgStr;
    self.msgLabel.text = msgStr;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor{
    _backgroundColor = backgroundColor;
    self.containView.backgroundColor = backgroundColor;
}


-(void)setButtonColor:(UIColor *)buttonColor{
    _buttonColor = buttonColor;
    for (UIView *btn in self.containView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [btn setBackgroundColor:buttonColor];
        }
    }
}

-(void)removeAlertView{
    if (self) {
        __weak typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.3 animations:^{
            weakSelf.containView.transform = CGAffineTransformMakeScale(0.001, 0.001);
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
            
        }];
    }
}

-(void)dealloc{
    NSLog(@"AlertView死了");
}

    
@end
