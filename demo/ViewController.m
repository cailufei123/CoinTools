//
//  ViewController.m
//  demo
//
//  Created by 蔡路飞 on 2020/9/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//
#import "ViewController.h"
#import <CoinTools/CoinTools.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
//    [super viewDidLoad];
   [self.navigationController pushViewController:[[GateHomePagesController alloc]init] animated:YES];
}


@end
