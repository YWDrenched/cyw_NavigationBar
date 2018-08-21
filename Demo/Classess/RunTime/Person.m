//
//  Person.m
//  Demo
//
//  Created by 陈友文 on 2018/8/2.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
    unsigned int count = 0;
    Ivar *ivrs = class_copyIvarList(self.class, &count);
    for (NSInteger i = 0; i<count; i++) {
        const char *iName = ivar_getName(ivrs[i]);
        NSString *name = [NSString stringWithUTF8String:iName];
        NSLog(@"%@",name);
        
        [aCoder encodeObject:[self valueForKey:name] forKey:name];
    }
    free(ivrs);
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)aDecoder {
    if (self = [super init]) {
        unsigned int count = 0;
        Ivar *ivrs = class_copyIvarList(self.class, &count);
        for (NSInteger i = 0; i<count; i++) {
            const char *iName = ivar_getName(ivrs[i]);
            NSString *name = [NSString stringWithUTF8String:iName];
//            NSLog(@"%@",name);
            id value = [aDecoder decodeObjectForKey:name];
            
            [self setValue:value forKey:name];
        }
        free(ivrs);
    
    }
    return self;
}


//-(void)test{
//    unsigned int count = 0;
//    objc_property_t *propertys = class_copyPropertyList(self.class, &count);
//    for (NSInteger i = 0; i < count; i++) {
//        const char *cName = property_getName(propertys[i]);
//        
//        NSString *name = [NSString stringWithUTF8String:cName];
//        
//        NSLog(@"%@",name);
//        
//    }
//}
//
//-(void)test01{
//    unsigned int count = 0;
//    Ivar *ivrs = class_copyIvarList(self.class, &count);
//    for (NSInteger i = 0; i<count; i++) {
//        const char *iName = ivar_getName(ivrs[i]);
//        NSString *name = [NSString stringWithUTF8String:iName];
//        NSLog(@"%@",name);
//    }
//}
-(void)study{
    NSLog(@"我是人，我在学习");
}

-(void)run{
    [self run];
    NSLog(@"我在跑");
}
@end
