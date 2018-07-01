//
//  BlockSyncxChainViewController.m
//  CALayer-UIImageView
//
//  Created by sve on 2018/7/1.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "BlockSyncxChainViewController.h"

@interface BlockSyncxChainViewController ()
@property (nonatomic, copy) void(^blockName) (NSString *name); //!<block作为属性
@end

@implementation BlockSyncxChainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"block的语法";
    
    // 局部变量的block定义 跟属性是一样的
    void (^tempBlock)(NSString *name) = ^(NSString *name){
        NSLog(@"%@",name);
    };
    
//    self.blockMethodReturnType(@"block作为返回值");
//
//    self.returnSelf.blockMethodReturnType(@"返回自身");
    
    self.blockWithReturnTypeRun(3).blockWithReturnTypeRun(5);
}

// block作为方法的参数,冒号后面,括号里面是block的定义类型,括号后面是block的变量名
- (void)showBlock:(void (^)(NSString *strPar))name {
    
}

// block作为方法的返回值 跟作为参数的格式是一样的
- (void(^)(NSString *str))blockMethodReturnType {
    
    return ^(NSString *str) {
        NSLog(@"传的字符串:--%@",str);
    };
}


- (BlockSyncxChainViewController *)returnSelf {
    return self;
}


// block作为get方法的返回值, block的返回值是Self,就可以使用链式语法
- (BlockSyncxChainViewController *(^)(int m))blockWithReturnTypeRun {
    
    BlockSyncxChainViewController *(^bloackName)(int m) = ^BlockSyncxChainViewController *(int miter){
        
        NSLog(@"跑了多少--%d",miter);
        
        return self;
    };
    
    return bloackName;
}

@end


// 作为属性和初始定义的block 名字直接在^后面
// 作为方法参数和返回值的Block 名字在最后,^后的名字移动到后面了,所以就剩下了(^)  先写标准模式的方法
// 作为返回值的block只定义了Block的类型,不需要名字,名字在方法里面返回了


// 点语法:get方法
// block作为方法的返回值,block带参数
// 链式语法:返回self
