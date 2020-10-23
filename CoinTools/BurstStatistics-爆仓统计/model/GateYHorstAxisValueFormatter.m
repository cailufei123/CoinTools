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
           moneyStr = [NSString stringWithFormat:@"%0.2lf亿",value * 0.000000001];
        }else  if (value>=10000) {
                  moneyStr = [NSString stringWithFormat:@"%0.2lf万",value * 0.00001];
        }else {
           moneyStr = [NSString stringWithFormat:@"%0.2lf",value * 0.001];
          
        }
    
   return moneyStr;
}
+(instancetype)getGateYHorstAxisValueFormatter{
    return  [[self alloc] init];
}

- (NSString *)formatDecimalNumber:(NSString *)string {
 if (!string || string.length == 0) {
 return string;
 }
  
 NSNumber *number = @([string doubleValue]);
 NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
 formatter.numberStyle = kCFNumberFormatterDecimalStyle;
 formatter.positiveFormat = @"###,##0.00";
  
 NSString *amountString = [formatter stringFromNumber:number];
 return amountString;
}
@end
