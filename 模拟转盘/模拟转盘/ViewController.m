//
//  ViewController.m
//  模拟转盘
//
//  Created by 丁瑞瑞 on 5/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"
#import "WheelView.h"
@interface ViewController ()
/** <#注释#>*/
@property (nonatomic,strong) WheelView *wheelView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WheelView *wheelView = [WheelView wheelView];
    wheelView.center = self.view.center;
    _wheelView = wheelView;
    [self.view addSubview:wheelView];
}

- (IBAction)start:(id)sender {
    [self.wheelView start];
}
- (IBAction)zanting:(id)sender {
    [self.wheelView zanting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
