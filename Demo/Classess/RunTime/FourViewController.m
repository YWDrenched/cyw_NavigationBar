//
//  FourViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/2.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "FourViewController.h"
#import <objc/runtime.h>
#import "Person.h"
#import "Dog.h"
#import"UIButton+test.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self test01];
    [self test02];

}

-(void)test{
    Person *p = [[Person alloc] init];
    //    [p test01];
    p.name = @"小黄";
    p.age = @"18";
    p.sex = @"girl";
    
    NSString *tmp = NSTemporaryDirectory();
    NSString *path = [tmp stringByAppendingPathComponent:@"obj.plist"];
    
    [NSKeyedArchiver archiveRootObject:p toFile:path];
    
    NSArray *arr = @[@{@"123":@"lisa"},@{@"111":@"haha"},@{@"222":@"lisa荣"}];
    NSString *str = [arr componentsJoinedByString:@","];
    NSLog(@"%@",str);
}

-(void)test01{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method personMenthon = class_getInstanceMethod([Person class], @selector(study));
        Method dogMethon = class_getInstanceMethod([Person class], @selector(run));
        method_exchangeImplementations(personMenthon, dogMethon);
    });
    
    Person *p = [[Person alloc] init];
//    Dog *dog = [[Dog alloc] init];
    
    [p study];
    
}

-(void)test02{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(200, 200, 30, 30);
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)btnClick{
    NSLog(@"点击了按钮");
}





@end
