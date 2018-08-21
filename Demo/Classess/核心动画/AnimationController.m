//
//  AnimationController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/20.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "AnimationController.h"

@interface AnimationController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *dataArr;

@property (nonatomic,strong)NSArray *titleArr;

@end

@implementation AnimationController

-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"CALayer",@"绘制CALayer",@"基础动画",@"关键帧动画",@"动画组",@"转场动画",@"UIView动画封装"];
    }
    return _dataArr;
}

-(NSArray *)titleArr{
    if (!_titleArr ) {
        _titleArr = @[@"LayerViewController",@"DrawLayerViewController",@"BaseAnimationViewController",@"KeyAnimationViewController",@"GruopViewController",@"TransitionViewController",@"ViewAnimationViewController"];
    }
    return _titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"animationCell"];
    [self.view addSubview:tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"animationCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[NSClassFromString(self.titleArr[indexPath.row]) new] animated:YES];
}





@end
