//
//  drawView.m
//  指示器等待时间
//
//  Created by 丁瑞瑞 on 7/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "drawView.h"

@implementation drawView

- (void)awakeFromNib{
    [super awakeFromNib];
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.frame = self.bounds;
    [self.layer addSublayer:repL];
    
    
    CALayer *dotLayer = [CALayer layer];
    dotLayer.backgroundColor = [UIColor greenColor].CGColor;
    dotLayer.frame = CGRectMake((self.bounds.size.width - 10) * 0.5, 20, 10, 10);
    dotLayer.cornerRadius = 5;
    dotLayer.transform = CATransform3DMakeScale(0, 0, 0);
    [repL addSublayer:dotLayer];
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.scale";
    anim.fromValue = @1;
    anim.toValue = @0;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 1;
    [dotLayer addAnimation:anim forKey:nil];
    
    repL.instanceCount = 15;
    repL.instanceDelay = 1 / 15.0;
    CGFloat angle = M_PI * 2 / 15.0;
    repL.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
}

@end
