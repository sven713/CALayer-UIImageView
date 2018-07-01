//
//  BlockViewController.m
//  CALayer-UIImageView
//
//  Created by sve on 2018/7/1.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "BlockViewController.h"


@interface BlockViewController ()
@property (nonatomic, copy) void(^blockName)(void);
@property (nonatomic, copy) void(^parBlock) (BlockViewController *blockVC);
@property (nonatomic, copy) NSString *name;
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self releaseBlock];
//    [self weakRelease];
    [self parReleaseBlock];
    
}

-(void)dealloc {
    NSLog(@"释放了");
}

#pragma mark 三种方式避免block的循环引用
- (void)parReleaseBlock { // 3.把self作为参数
    self.name = @"宋锡铭";
    self.parBlock = ^(BlockViewController *vc){
        NSLog(@"名字:%@",vc.name);
    };
    self.parBlock(self);
}

- (void)releaseBlock { // 2.在block内部把引用的外部变量设置为nil
    __block BlockViewController *bVC = self;
    self.blockName = ^(void) {
        NSLog(@"%@",bVC);
        bVC = nil;
    };
    self.blockName(); // 不调用是不会释放的!!!!!!!
}

- (void)weakRelease { // 1.使用weak修饰
    __weak typeof(self)weakSelf = self;
    self.blockName = ^(void){
        NSLog(@"%@",weakSelf); // 可以释放
        NSLog(@"%@",self); // 不能释放
    };

}


@end
