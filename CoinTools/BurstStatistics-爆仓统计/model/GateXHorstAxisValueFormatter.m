//
//  GateXHorstAxisValueFormatter.m
//  block-pro
//
//  Created by MAC on 2020/9/1.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateXHorstAxisValueFormatter.h"

@implementation GateXHorstAxisValueFormatter


/// 实现协议方法，返回 x 轴的数据
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {

   // value 为 x 轴的值
 
    return [NSString stringWithFormat:@"%@",@"ee个"];
}

+(instancetype)getGateXHorstAxisValueFormatter{
    return  [[self alloc] init];
}

@end
