//
//  Person.h
//  Demo
//
//  Created by 陈友文 on 2018/8/2.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface Person : NSObject<NSCoding>

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *sex;

@property (nonatomic,copy) NSString *age;

-(void)study;

-(void)run;

//-(void)test;
//
//-(void)test01;
@end
