//
//  ViewController.m
//  CALayer-UIImageView
//
//  Created by sve on 2018/6/29.
//  Copyright © 2018年 sve. All rights reserved.
//

#import "SVEViewController.h"

@interface SVEViewController ()

@end

@implementation SVEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layer_ImageVeiw];
}

- (void)layer_ImageVeiw {
    CALayer *layer = [[CALayer alloc] init];
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"把时间当做朋友"].CGImage; // 必须转换成CGImage否则显示不出来
    layer.frame = CGRectMake(20, 100, 300, 300);
    
    // layer不能添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(aaaa)];
    
}

@end
