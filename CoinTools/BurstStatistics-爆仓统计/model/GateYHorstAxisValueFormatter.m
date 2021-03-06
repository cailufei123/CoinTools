//
//  GateYHorstAxisValueFormatter.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateYHorstAxisValueFormatter.h"

@implementation GateYHorstAxisValueFormatter
/// 实现协议方法，返回 y 轴的数据
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {

   // value 为 y 轴的值
    NSString * moneyStr = @"0";
        if (value>=100000000){
           moneyStr = [NSString stringWithFormat:@"%0.2lf亿",value * 0.00000001];
        }else  if (value>=1000000) {
                  moneyStr = [NSString stringWithFormat:@"%0.2lf万",value * 0.000001];
        }else {
           moneyStr = [NSString stringWithFormat:@"%0.2lf",value * 0.001];
          
        }
   return moneyStr;
}
+(instancetype)getGateYHorstAxisValueFormatter{
    return  [[self alloc] init];
}


@end
