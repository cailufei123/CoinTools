//
//  GTXAxisFearIndexValueFormatter.m
//  CoinTools
//
//  Created by MAC on 2020/9/21.
//  Copyright © 2020 蔡路飞. All rights reserved.
//

#import "GTXAxisFearIndexValueFormatter.h"
#import "GTFearIndexModel.h"
@implementation GTXAxisFearIndexValueFormatter
/// 实现协议方法，返回 x 轴的数据
- (NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis {

   // value 为 x 轴的值
    GTBcoin_btc_vix_data_infoModel * bcoin_btc_vix_data_infoModel = self.publicArry[(NSInteger)value];
    return [NSString stringWithFormat:@"%@",[self getDateStringWithTimestamp:bcoin_btc_vix_data_infoModel.time_stamp]];
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
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}
@end
