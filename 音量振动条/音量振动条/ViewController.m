//
//  ViewController.m
//  音量振动条
//
//  Created by 丁瑞瑞 on 6/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *forwardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    创建复制层
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = self.forwardView.bounds;
    repL.instanceCount = 5;
    repL.instanceTransform = CATransform3DMakeTranslation(40, 0, 0);
    repL.instanceDelay = 0.5;
    [self.forwardView.layer addSublayer:repL];
    
    
    CALayer *layer = [[CALayer alloc] init];
    layer.position = CGPointMake(0, _forwardView.bounds.size.height);
    layer.anchorPoint = CGPointMake(0, 1);
    layer.bounds = CGRectMake(0, 0, 30, 80);
    layer.backgroundColor = [UIColor redColor].CGColor;
    
    [repL addSublayer:layer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale.y";
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 0.5;
    anim.autoreverses = YES;

    [layer addAnimation:anim forKey:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
