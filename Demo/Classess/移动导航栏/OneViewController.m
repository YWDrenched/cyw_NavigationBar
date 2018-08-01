//
//  OneViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/7/31.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "OneViewController.h"
#import "UINavigationBar+cyw_NavigationBar.h"

@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *testArr;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

-(void)setupUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"充电桩2"]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    [self.navigationController.navigationBar cyw_setNavgationBarColor:[UIColor colorWithRed:61/255.0 green:45/255.0 blue:145/255.0 alpha:1]];
}


-(void)btnClick{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return self.testArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    cell.textLabel.text = self.testArr[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 200;
    }
    return 44;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    view.backgroundColor = [UIColor orangeColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.text = @"titlet头部";
    [view addSubview:label];
    return view;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"%f",offsetY);
    if (offsetY > 0) {
        if (offsetY >= 44) {
            [self setNavigationMove:1];
        } else {
            [self setNavigationMove:(offsetY / 44)];
        }
    }else{
        [self setNavigationMove:0];
        self.navigationController.navigationBar.backIndicatorImage = [UIImage new];
    }
    
}

- (void)setNavigationMove:(CGFloat)progress
{
    [self.navigationController.navigationBar cyw_setTranslationY:(-44 * progress)];
    [self.navigationController.navigationBar cyw_setNavgationAlpha:(1-progress)];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar cyw_resetMask];
}

-(NSArray *)testArr{
    if (!_testArr) {
        _testArr = @[@"凯尔特人",@"湖人",@"火箭",@"勇士",@"76人",@"雷霆",@"老鹰",@"奇才",@"骑士",@"猛龙",@"马刺",@"小牛",@"灰熊",@"开拓者",@"步行者",@"鹈鹕",@"热火"];
    }
    return _testArr;
}


@end
