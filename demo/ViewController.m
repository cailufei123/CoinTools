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

// 读取本地JSON文件
- (NSDictionary *)readLocalFileWithName:(NSString *)name {
    // 获取文件路径

    NSString *path = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"json"];
    // 将文件数据化
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    // 对数据进行JSON格式化并返回字典形式
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}
@end
