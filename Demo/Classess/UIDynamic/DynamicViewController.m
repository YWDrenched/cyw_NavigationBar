//
//  DynamicViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/23.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "DynamicViewController.h"

@interface DynamicViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *dataArr;

@property (nonatomic,strong)NSArray *titleArr;

@end

@implementation DynamicViewController

-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"重力行为",@"碰撞行为",@"吸附行为",@"附着行为",@"推行为"];
    }
    return _dataArr;
}

-(NSArray *)titleArr{
    if (!_titleArr ) {
        _titleArr = @[@"GravityBehaviorViewController",@"CollisionViewController",@"SanpViewController",@"AttachViewController",@"PushBViewController"];
    }
    return _titleArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"BehaviorCell"];
    [self.view addSubview:tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"BehaviorCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[NSClassFromString(self.titleArr[indexPath.row]) new] animated:YES];
}

@end
