//
//  GTXYxisFearIndexValueFormatter.m
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTYxisFearIndexValueFormatter.h"

@implementation GTYxisFearIndexValueFormatter
/// 实现协议方法，返回 y 轴的数据
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    // value 为 y 轴的值
     NSString * moneyStr = @"0";
         if (value>=100000000){
            moneyStr = [NSString stringWithFormat:@"%0.2lf亿",value * 0.00000001];
         }else  if (value>=1000000) {
                   moneyStr = [NSString stringWithFormat:@"%0.2lf万",value * 0.000001];
         }else {
            moneyStr = [NSString stringWithFormat:@"%0.1lfk",value * 0.001];
           
         }
    return moneyStr;
}
+(instancetype)getGTYxisFearIndexValueFormatter{
    return  [[self alloc] init];
}
-(void)setPublicArry:(NSArray *)publicArry{
      _publicArry = publicArry;
}

@end
