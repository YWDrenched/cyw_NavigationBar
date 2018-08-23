//
//  ViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/7/31.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationBar+cyw_NavigationBar.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong)NSArray *dataArr;

@property (nonatomic,strong)NSArray *titleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    self.tableView.sectionHeaderHeight = 40;
//     [self.navigationController.navigationBar cyw_setNavgationBarColor:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]];
    
}

#pragma mark tableViewDataSource



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    cell.textLabel.text = self.titleArr[indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[NSClassFromString(self.dataArr[indexPath.row]) new] animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 44;
}

-(NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = @[@"OneViewController",@"TwoViewController",@"ThreeViewController",@"FourViewController",@"FiveViewController",@"LottieViewController",@"AnimationController",@"Quartz2DViewController",@"BezierPathViewController",@"DynamicViewController"];
    }
    return _dataArr;
}

-(NSArray *)titleArr{
    if (!_titleArr) {
        _titleArr = @[@"tableView滚动",@"导航栏透明",@"自定义弹窗",@"RunTime",@"转场动画",@"Lottie动画",@"核心动画",@"Quartz2D",@"UIBezierPath",@"UIDynamic"];
    }
    return _titleArr;
}


@end
