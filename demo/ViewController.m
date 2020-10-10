//
//  ViewController.m
//  demo
//
//  Created by 蔡路飞 on 2020/9/10.
//  Copyright © 2020 蔡路飞. All rights reserved.
//
#import "ViewController.h"
#import <CoinTools/CoinTools.h>
#import <CoinTools/CoinTools-Swift.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
//    [super viewDidLoad];
//    [Ga=teHomePageController pushHomePageController];
//    NSDictionary * dict =  [self readLocalFileWithName:@"file"];
    
    [CoinTool pushHomePageControllers];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [CoinTool pushHomePageControllers];
}
@end
