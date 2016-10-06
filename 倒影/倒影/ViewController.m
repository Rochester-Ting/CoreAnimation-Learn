//
//  ViewController.m
//  倒影
//
//  Created by 丁瑞瑞 on 7/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CAReplicatorLayer *repL = (CAReplicatorLayer *)self.view.layer;
    repL.instanceCount = 2;
    repL.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    //倒影
    repL.instanceRedOffset -= 0.1;
    repL.instanceBlueOffset -= 0.1;
    repL.instanceGreenOffset -= 0.1;
    repL.instanceAlphaOffset -= 0.1;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
