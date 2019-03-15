//
//  ViewController.m
//  WGProgram
//
//  Created by wanggang on 2019/1/31.
//  Copyright © 2019 bozhong. All rights reserved.
//

#import "ViewController.h"
#import "WGAddManager.h"
//项目名称-Swift.h
#import "WGProgram-Swift.h"

@interface ViewController ()

@property (nonatomic, strong) WGAddManager *add;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"ViewController";
    
    WGSwiftTest *sw = [[WGSwiftTest alloc] init];
    [sw swiftFuc];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self test01];
    [self test02];
    [self test03];
    [self test04];
}

//普通写法
- (void)test01{
    
    self.add = [[WGAddManager alloc] init];

    [_add add:1];
    [_add add:2];
    [_add add:3];
    [_add add:4];
    NSLog(@"test01结果:%ld", _add.result);
}

//点语法
- (void)test02{
    
    self.add = [[WGAddManager alloc] init];

    _add.add(1);
    _add.add(2);
    _add.add(3);
    _add.add(4);
    NSLog(@"test02结果:%ld", _add.result);
}

//链式
- (void)test03{
    
    self.add = [[WGAddManager alloc] init];
    
    NSInteger res = _add.LSAdd(1).LSAdd(2).LSAdd(3).LSAdd(4).result;
    NSLog(@"test03结果:%ld", res);
}

- (void)test04{
    
    self.add = [[WGAddManager alloc] init];

    NSInteger res = [_add HSadd:^NSInteger(NSInteger num) {
        num += 1;
        num += 2;
        num += 3;
        num += 4;
        return num;
    }].result;
    
    NSLog(@"test04结果:%ld", res);

}


@end
