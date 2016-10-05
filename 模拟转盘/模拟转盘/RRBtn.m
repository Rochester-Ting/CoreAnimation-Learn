//
//  RRBtn.m
//  模拟转盘
//
//  Created by 丁瑞瑞 on 5/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "RRBtn.h"

@implementation RRBtn
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = 40;
    CGFloat imageH = 44;
    CGFloat imageX = (contentRect.size.width - imageW) * 0.5;
    CGFloat imageY = 20;
    
    return CGRectMake(imageX, imageY, imageW, imageH);
}


//取消高亮状态下系统做的事情.
-(void)setHighlighted:(BOOL)highlighted{
    
}

@end
