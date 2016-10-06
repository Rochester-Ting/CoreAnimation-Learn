//
//  ViewController.m
//  粒子效果
//
//  Created by 丁瑞瑞 on 7/10/16.
//  Copyright © 2016年 Rochester. All rights reserved.
//

#import "ViewController.h"
#import "drawView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet drawView *drawView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)start:(id)sender {
    [self.drawView startAnim];
}

- (IBAction)clear:(id)sender {
    [self.drawView endAnim];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
