//
//  ViewController.m
//  模拟时钟效果
//
//  Created by 丁瑞瑞 on 4/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;
/** 秒*/
@property (nonatomic,strong) CALayer *secondLayer;
/** 分钟*/
@property (nonatomic,strong) CALayer *minutesLayer;
/** 小时*/
@property (nonatomic,strong) CALayer *hourLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    添加秒针
    [self addSecondLayer];
    [self addMinutesLayer];
    [self addHourLayer];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
}
- (void)updateTime{
//    获取当前时间
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:[NSDate date]];
//    获取秒
    NSInteger second = components.second;
//    获取分钟
    NSInteger minutes = components.minute;
//    获取小时
    NSInteger hour = components.hour;
    
//    一秒秒针转动的弧度
    CGFloat secondAngle = 6 * (M_PI / 180);
//    一分钟分针转动的弧度
    CGFloat minutesAngle = 6 *(M_PI / 180);
//    一小时时针转动的弧度
    CGFloat hourAngle = 30 * (M_PI / 180);
//    一分钟时针转动的弧度
    CGFloat minutesHourAngle = 0.5 * (M_PI / 180);
    
    _secondLayer.transform = CATransform3DMakeRotation(secondAngle * second, 0, 0, 1);
    _minutesLayer.transform = CATransform3DMakeRotation(minutes * minutesAngle, 0, 0, 1);
    _hourLayer.transform = CATransform3DMakeRotation(hour * hourAngle + minutes * minutesHourAngle, 0, 0, 1);
}
- (void)addSecondLayer{
    CALayer *layer = [[CALayer alloc] init];
    _secondLayer = layer;
    layer.frame = CGRectMake(0, 0, 1, 75);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.imageV.layer addSublayer:layer];
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(100, 100);
    NSLog(@"%.2f",self.imageV.frame.size.width);
}
- (void)addMinutesLayer{
    CALayer *layer = [[CALayer alloc] init];
    _minutesLayer = layer;
    layer.frame = CGRectMake(0, 0, 1.5, 70);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    [self.imageV.layer addSublayer:layer];
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(100, 100);
    NSLog(@"%.2f",self.imageV.frame.size.width);
}
- (void)addHourLayer{
    CALayer *layer = [[CALayer alloc] init];
    _hourLayer = layer;
    layer.frame = CGRectMake(0, 0, 1.5, 65);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.imageV.layer addSublayer:layer];
    layer.anchorPoint = CGPointMake(0.5, 1);
    layer.position = CGPointMake(100, 100);
    NSLog(@"%.2f",self.imageV.frame.size.width);
}

@end
