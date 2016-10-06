//
//  drawView.m
//  粒子效果
//
//  Created by 丁瑞瑞 on 7/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "drawView.h"

@interface drawView ()
/** */
@property (nonatomic,strong) UIBezierPath *path;
/** <#注释#>*/
//@property (nonatomic,strong) <#type#> <#name#>;
/** <#注释#>*/
@property (nonatomic,strong) NSMutableArray *pathArr;
/** <#注释#>*/
@property (nonatomic,strong) CALayer *dotLayer;
@end
@implementation drawView
- (NSMutableArray *)pathArr{
    if (!_pathArr) {
        _pathArr = [NSMutableArray array];
    }
    return _pathArr;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    CAReplicatorLayer *repL = [CAReplicatorLayer layer];
    repL.instanceCount = 20;
    repL.instanceDelay = 0.25;
    [self.layer addSublayer:repL];
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(-1000, 0, 10, 10);
    layer.backgroundColor = [UIColor redColor].CGColor;
    self.dotLayer = layer;
    [repL addSublayer:layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;

}
- (void)startAnim{
    
        CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
        anim.keyPath = @"position";
        anim.path = self.path.CGPath;
        anim.repeatCount = MAXFLOAT;
        anim.duration = 3;
        [self.dotLayer addAnimation:anim forKey:nil];
    
   
}
- (void)endAnim{
    [self.dotLayer removeAllAnimations];
    [self.pathArr removeAllObjects];
    [self setNeedsDisplay];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint curPoint = [touch locationInView:self];
   ;
//    [self.pathArr addObject:path];
    [self.path moveToPoint:curPoint];

}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint curPoint = [touch locationInView:self];
    
    
    [_path addLineToPoint:curPoint];
    [self setNeedsDisplay];

}
- (void)drawRect:(CGRect)rect{
    [self.path stroke];
}
@end
