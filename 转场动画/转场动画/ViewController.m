//
//  ViewController.m
//  转场动画
//
//  Created by 丁瑞瑞 on 6/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"
#import "BAViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)btnClick:(id)sender {
    BAViewController *baVc = [[BAViewController alloc] init];
    [self.navigationController pushViewController:baVc animated:YES];
//    创建转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"suckEffect";
    anim.duration = 2;
    [self.navigationController.view.layer addAnimation:anim forKey:nil];
//    转场动画的类型
//    cube:立体翻转效果
//    fade:交叉淡化过度
//    push:新视图把旧视图推出去
//    moveIn:新视图移到旧视图上面
//    reveal:将旧视图移开,显示下面的新视图
//    bglFlip:上下左右翻转效果
//    suckEffect:收缩效果,如一块布给抽走
//    rippleEffect:水滴效果
//    pageCurl:向上翻页效果
//    pageUnCurl:向下翻页效果
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
