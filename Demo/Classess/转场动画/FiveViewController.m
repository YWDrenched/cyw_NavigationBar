//
//  FiveViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/7.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "FiveViewController.h"
#import "PresentAnimation.h"
#import "cyw_Transition.h"
#import "DismissAnimation.h"
#import "PushAnimation.h"
#import "PopAnimation.h"
#import "Push_Transition.h"


@interface FiveViewController ()<UITableViewDelegate,UITableViewDataSource,UIViewControllerTransitioningDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong)NSArray *dataArr;
@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong)PresentAnimation *presentAnimation;
@property (nonatomic,strong)cyw_Transition *precentTransition;
@property (nonatomic,strong)DismissAnimation *dismissAnimation;
@property (nonatomic,strong)PushAnimation *pushAnimation;
@property (nonatomic,strong)PopAnimation *popAnimation;
@property (nonatomic,strong)Push_Transition *pushTransition;

@end

@implementation FiveViewController


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        _presentAnimation = [PresentAnimation new];
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转场动画";
    [self setupUI];
}

-(void)setupUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    _presentAnimation = [PresentAnimation new];
    _precentTransition = [cyw_Transition new];
    _dismissAnimation = [DismissAnimation new];
    _pushAnimation = [PushAnimation new];
    _popAnimation = [PopAnimation new];
    _pushTransition  = [Push_Transition new];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    UIViewController *vc = [NSClassFromString(self.dataArr[indexPath.row]) new];
    if (indexPath.row == 0) {
        UIViewController *vc = [NSClassFromString(self.dataArr[indexPath.row]) new];
        [self.precentTransition writeToViewController:vc];
        vc.transitioningDelegate = self;
        [self presentViewController:vc animated:YES completion:nil];
    }else{
        UIViewController *vc = [NSClassFromString(self.dataArr[indexPath.row]) new];
        [self.pushTransition writeToViewController:vc];
        self.navigationController.delegate =  self;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    NSLog(@"%s",__func__);
    return operation == UINavigationControllerOperationPush ? self.pushAnimation : self.popAnimation;
    
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.presentAnimation;
}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.dismissAnimation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.precentTransition.intreing ? self.precentTransition : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    //手势开始的时候才需要传入手势过渡代理，如果直接点击pop，应该传入空，否者无法通过点击正常pop
    return self.pushTransition.intreing ? self.pushTransition  : nil;
    
}




-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"ModelViewController",@"PushViewController"];
    }
    return _dataArr;
}

-(NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"模态",@"push"];
    }
    return _titleArr;
}

@end
