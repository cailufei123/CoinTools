//
//  GTXAxisFearIndexValueFormatter.m
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//
//@property(nonatomic,copy) NSString *long_rate;//" : "0.7204",
//@property(nonatomic,copy) NSString *exchange_future_type;//" : "Okex_quarter",
//@property(nonatomic,copy) NSString *offer;//" : "10746.02",
//@property(nonatomic,copy) NSString *time_type;//" : "5m",
//@property(nonatomic,copy) NSString *time_stamp;//" : "1602144600",
//@property(nonatomic,copy) NSString *total_type;//" : "1d",
//@property(nonatomic,copy) NSString *coin_type;//" : "BTC"
#import "GTXAxisFearIndexValueFormatter.h"
#import "GTFearIndexModel.h"
@implementation GTXAxisFearIndexValueFormatter
/// 实现协议方法，返回 x 轴的数据
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {
    if (self.formatterType == GTFormatterXDuoKong) {
         // value 为 x 轴的值
//           bcoin_coin_long_short_infoModel * coin_long_short_infoModel = self.publicArry[(NSInteger)value];
           return @"23のedw";
    }else{
        
 // value 为 x 轴的值
    GTHomeTitleModel * titleModel  = self.publicArry[(NSInteger)value];
    return [NSString stringWithFormat:@"%@",[self getDateStringWithTimestamp:titleModel.content]];
    }
    
    
  
}
+(instancetype)getGTXAxisFearIndexValueFormatter{
    return  [[self alloc] init];
}

-(void)setPublicArry:(NSArray *)publicArry{
      _publicArry = publicArry;
}
// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimestamp:(NSString *)str {
//    NSTimeInterval time = [str doubleValue]/1000; // 传入的时间戳str如果是精确到毫秒的记得要/1000
     NSTimeInterval time = [str doubleValue]; // 传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // 实例化一个NSDateFormatter对象
    // 设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"YYYY-MM-dd HH:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}
// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimestamp1:(NSString *)str {
//    NSTimeInterval time = [str doubleValue]/1000; // 传入的时间戳str如果是精确到毫秒的记得要/1000
     NSTimeInterval time = [str doubleValue]; // 传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // 实例化一个NSDateFormatter对象
    // 设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM月dd日 HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}
@end
