//
//  TwoViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/7/31.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "TwoViewController.h"
#import "UINavigationBar+cyw_NavigationBar.h"

@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)NSArray *testArr;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"透明导航栏";
    [self setupUI];

}

-(void)setupUI{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"twoCellID"];
    

}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.testArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"twoCellID" forIndexPath:indexPath];
    cell.textLabel.text = self.testArr[indexPath.row];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetY = scrollView.contentOffset.y;
    UIColor *color = [UIColor colorWithRed:45/255.0 green:45/255.0 blue:45/255.0 alpha:1];
    if (offsetY >= 0) {
        CGFloat alpha = offsetY / 100;
        NSLog(@" alpha = %f ",alpha);
        [self.navigationController.navigationBar cyw_setNavgationBarColor:[color colorWithAlphaComponent:alpha]];
    }else{
        [self.navigationController.navigationBar cyw_setNavgationBarColor:[color colorWithAlphaComponent:0]];
    }

    NSLog(@"y  =  %f",offsetY);
    
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
