//
//  WheelView.m
//  模拟转盘
//
//  Created by 丁瑞瑞 on 5/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "WheelView.h"


@interface WheelView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end
@implementation WheelView
+ (instancetype)wheelView{
    return [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil].firstObject;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"WheelView" owner:nil options:nil].firstObject;
    }
    return self;
}

@end
