//
//  WGAddManager.h
//  WGProgram
//
//  Created by wanggang on 2019/1/31.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WGAddManager : NSObject

@property (nonatomic, assign) NSInteger result;

//普通
- (void)add:(NSInteger)num;

//点语法实现:没有参数+有返回值
- (void(^)(NSInteger num))add;

//链式:在点语法基础上返回self
- (WGAddManager *(^)(NSInteger num))LSAdd;

//函数式:block作为参数+返回self
- (WGAddManager *)HSadd:(NSInteger(^)(NSInteger num))addBlock;

@end

NS_ASSUME_NONNULL_END
