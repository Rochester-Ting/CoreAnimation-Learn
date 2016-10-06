//
//  ViewController.m
//  图片折叠
//
//  Created by 丁瑞瑞 on 6/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *TopImageV;

@property (weak, nonatomic) IBOutlet UIImageView *BottomImageV;

@property (weak, nonatomic) IBOutlet UIView *forwardView;

/** <#注释#>*/
@property (nonatomic,strong) CAGradientLayer *gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //让上面的图片显示上面部分
    self.TopImageV.layer.contentsRect = CGRectMake(0, 0, 1, 0.5);
    self.TopImageV.layer.anchorPoint = CGPointMake(0.5, 1);
//    让下面的图片显示下面的部分
    self.BottomImageV.layer.contentsRect = CGRectMake(0, 0.5, 1, 0.5);
    self.BottomImageV.layer.anchorPoint = CGPointMake(0.5, 0);
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.forwardView addGestureRecognizer:pan];
    
    //给下面图片设置渐变层
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.BottomImageV.bounds;
    [self.BottomImageV.layer addSublayer:gradientLayer];
    gradientLayer.colors = @[(id)[UIColor clearColor].CGColor,(id)[UIColor blackColor].CGColor];
    //设置不透明度
    gradientLayer.opacity = 0;
    _gradientLayer = gradientLayer;
}
- (void)pan:(UIGestureRecognizer *)pan{
//    获取当前的偏移量的y
    CGPoint curPoint = [pan locationInView:self.forwardView];
    CGFloat angle = M_PI * curPoint.y / 200.0;
    //设置近大远小的效果
    CATransform3D transform3D = CATransform3DIdentity;
    transform3D.m34 = -1 / 400.0;
    self.TopImageV.layer.transform = CATransform3DRotate(transform3D, -angle, 1, 0, 0);
    
    _gradientLayer.opacity = 1 * curPoint.y / 200.0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        self.gradientLayer.opacity = 0;
        //delay:动画延时执行时间
        //Damping:弹性系数,设的超小, 弹性就越大
        //Velocity:弹性的初始速度
        //options:以什么样样式来做动画,开始有结束慢,
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.TopImageV.layer.transform = CATransform3DIdentity;
        } completion:nil];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
