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
    
    if (self.formatterType == GTFormatterYLeftAxisDuoKong) {
        
       
        return  [NSString stringWithFormat:@"$%@",[self formatDecimalNumber:[NSString stringWithFormat:@"%lf",value]]] ;
    } else  if (self.formatterType == GTFormatterYRightDuoKong) {
        return [self formatPercentage:value];
    } else  if (self.formatterType == GTFormatterYRightChiCang) {
       return [NSString stringWithFormat:@"$%@",[self formatDecimalNumber:[NSString stringWithFormat:@"%lf",value]]] ;
      
  }else  if (self.formatterType == GTFormatterYLeftAxisKongHuang) {
      return [NSString stringWithFormat:@"%d",(int)value ];
     
 } else  if (self.formatterType == GTFormatterYRightKongHuang) {
     return [NSString stringWithFormat:@"%@",[self formatDecimalNumber:[NSString stringWithFormat:@"%lf",value]]] ;
    
} else{
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
- (NSString *)formatPercentage:(double)value {
    return [NSString stringWithFormat:@"%0.2lf",value * 100];
}

//- (NSString *)formatToTwoDecimal:(id)count {
//    NSString *originNumber;
//    if ([count isKindOfClass:[NSString class]] || [count isKindOfClass:[NSNumber class]]) {
//        NSInteger i = [count integerValue];
//        originNumber = [NSString stringWithFormat:@"%ld",(long)i];
//    } else {
//        return @"$0.00";
//    }
//    NSDecimalNumber *one = [NSDecimalNumber decimalNumberWithString:originNumber];
//    NSDecimalNumber *two = [NSDecimalNumber decimalNumberWithString:@"100"];
//    NSDecimalNumber *thr = [one decimalNumberByDividingBy:two];
//
//    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
//    formatter.positiveFormat = @",###.##";
//    NSString *money = [formatter stringFromNumber:[NSNumber numberWithDouble:[thr doubleValue]]];
//
//    NSString *result = [NSString stringWithFormat:@"$%@",money];
//
//    if (![result containsString:@"."]) {  //被整除的情况
//        result = [NSString stringWithFormat:@"%@.00",result];
//    } else {                              //小数不足两位
//        NSArray *array = [result componentsSeparatedByString:@"."];
//        NSString *subNumber = array.lastObject;
//        if (subNumber.length == 1) {
//            result = [NSString stringWithFormat:@"%@.%@0",array.firstObject, array.lastObject];
//        }
//    }
//    return result;
//}
+(instancetype)getGTYxisFearIndexValueFormatter{
    return  [[self alloc] init];
}
-(void)setPublicArry:(NSArray *)publicArry{
      _publicArry = publicArry;
}

@end
