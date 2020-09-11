//
//  GateData2TableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/8/26.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateData2TableViewCell.h"

@implementation GateData2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setBurst_dtl:(GateBurst_dtlModel *)burst_dtl{
    self.typeLb.text = burst_dtl.burst_plat;
     self.numberLb.text = burst_dtl.bran_type;
     self.moneyLb.text = [self getFomterNumber:burst_dtl.burst_amt];
    
    
    
   
    
       
    
    self.timeLb.text =[self dateWithFormatString:burst_dtl.burst_time];
}
//2020-08-19 12:18:42;
-(NSString *)dateWithFormatString:(NSString *)string
{
    // 实例化NSDateFormatter
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc] init];
    //传进来的日期格式 2020-08-19T12:17:26;
   
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //要转换的日期字符串
//    = @"2020-08-19 12:18:42";
     NSString *dateString1 = [string stringByReplacingOccurrencesOfString:@"T"withString:@" "];
    //NSDate形式的日期
    NSDate *date =[formatter1 dateFromString:dateString1];

    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    //目标格式
    [formatter2 setDateFormat:@"HH:mm"];
    NSString *timeString = [formatter2 stringFromDate:date ];

    return timeString;
}

-(NSString *)getFomterNumber:(NSString *)value{
     NSString * moneyStr = @"0";
    if (value.doubleValue>=100000000){
                 moneyStr = [NSString stringWithFormat:@"%0.2lf亿",value.doubleValue * 0.00000001];
              }else  if (value.doubleValue>=10000) {
                        moneyStr = [NSString stringWithFormat:@"%0.2lf万",value.doubleValue * 0.0001];
              }else {
                 moneyStr = [NSString stringWithFormat:@"%0.2lf",value.doubleValue * 0.001];
                
            }
    return moneyStr;
}
@end
