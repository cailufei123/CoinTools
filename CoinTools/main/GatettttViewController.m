//
//  GatettttViewController.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GatettttViewController.h"

@interface GatettttViewController ()

@end

@implementation GatettttViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    GatettttViewController * nv = [[GatettttViewController alloc] init];
       [self.navigationController pushViewController:nv animated:YES];
}

@end
