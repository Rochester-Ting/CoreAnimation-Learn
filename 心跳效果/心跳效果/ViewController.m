//
//  ViewController.m
//  心跳效果
//
//  Created by 丁瑞瑞 on 5/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.8;
//    自动反转
    anim.autoreverses = YES;
////    不要移除动画
//    anim.removedOnCompletion = NO;
////    保留动画最后的效果
//    anim.fillMode = @"forwards";
    [self.redView.layer addAnimation:anim forKey:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
