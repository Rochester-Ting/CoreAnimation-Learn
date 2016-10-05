//
//  WheelView.m
//  模拟转盘
//
//  Created by 丁瑞瑞 on 5/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "WheelView.h"
#import "RRBtn.h"

@interface WheelView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
/** <#注释#>*/
@property (nonatomic,strong) UIButton *selectedBtn;

/** <#注释#>*/
@property (nonatomic,strong) CADisplayLink *link;
@end
@implementation WheelView
- (CADisplayLink *)link{
    if (!_link) {
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}
+ (instancetype)wheelView{
    return [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil].firstObject;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil].firstObject;
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setUp];
}
- (void)setUp{
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = 65;
    CGFloat btnH = 148;
    CGFloat angle = 0;
//    获取需要截取的图片
    UIImage *originImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *originSelectedImage = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    
    CGFloat scale =  [UIScreen mainScreen].scale;
    CGFloat imageW = originImage.size.width / 12 * scale;
    CGFloat imageH = originImage.size.height * scale;
    for (int i = 0; i < 12; i++) {
        RRBtn *btn = [RRBtn buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(btnX, btnY, btnW, btnH);
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.imageV.bounds.size.width * 0.5, self.imageV.bounds.size.height * 0.5);
        
        CGImageRef imageRef = CGImageCreateWithImageInRect(originImage.CGImage, CGRectMake(0 + i * imageW , 0, imageW, imageH));
//        转化成image
        UIImage *contentImage = [UIImage imageWithCGImage:imageRef];
        [btn setImage:contentImage forState:UIControlStateNormal];
        
        
        CGImageRef imageS = CGImageCreateWithImageInRect(originSelectedImage.CGImage, CGRectMake(0 + i * imageW , 0, imageW, imageH));
        UIImage *selectedImage = [UIImage imageWithCGImage:imageS];
        [btn setImage:selectedImage forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        btn.backgroundColor = [UIColor redColor];
        UIImage *backImage = [UIImage imageNamed:@"LuckyRototeSelected"];
        [btn setBackgroundImage:backImage forState:UIControlStateSelected];
        [self.imageV addSubview:btn];
        btn.transform = CGAffineTransformMakeRotation(angle / 180 * M_PI);
        angle += 30;
        if (i == 0) {
            btn.selected = YES;
            self.selectedBtn = btn;
        }
    }
}
- (void)btnClick:(UIButton *)btn{
    self.selectedBtn.selected = NO;
    btn.selected = YES;
    self.selectedBtn = btn;
}
- (IBAction)startSelectNum:(id)sender {
    self.link.paused = YES;
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @(M_PI * 4);
    anim.duration = 1;
    anim.delegate = self;
    [self.imageV.layer addAnimation:anim forKey:nil];
}
//当动画完成时调用.
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //动画结束时把选中的按钮指上最上方.
    //当前选中的按钮,旋转角度.
    CGAffineTransform transform = self.selectedBtn.transform;
    CGFloat angle = atan2f(transform.b, transform.a);
    
    
    //让contentV倒着旋转回去.
    self.imageV.transform = CGAffineTransformMakeRotation(-angle);
    NSLog(@"%s",__func__);
    
}

- (void)start{
    self.link.paused = NO;
    self.imageV.transform = CGAffineTransformRotate(self.imageV.transform, M_PI / 180);
}

- (void)zanting{
    self.link.paused = YES;
}
- (void)updateTime{
    [self start];
}
@end
