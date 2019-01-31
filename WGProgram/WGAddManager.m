//
//  WGAddManager.m
//  WGProgram
//
//  Created by wanggang on 2019/1/31.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "WGAddManager.h"

@implementation WGAddManager

- (void)add:(NSInteger)num{
    self.result += num;
}

//点语法实现:没有参数+有返回值
- (void(^)(NSInteger num))add{
    
    __weak typeof(self) weakSelf = self;
    return ^(NSInteger num){
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.result += num;
    };
}

//链式:在点语法基础上返回self
- (WGAddManager *(^)(NSInteger num))LSAdd{
    
    __weak typeof(self) weakSelf = self;
    return ^WGAddManager *(NSInteger num){
        __strong typeof(self) strongSelf = weakSelf;
        strongSelf.result += num;
        return self;
    };
}

//函数式
- (WGAddManager *)HSadd:(NSInteger(^)(NSInteger num))addBlock{
    
    _result = addBlock(_result);
    return self;
}

@end
