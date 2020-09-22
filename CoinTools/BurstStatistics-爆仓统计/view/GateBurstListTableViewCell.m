//
//  GateBurstListTableViewCell.m
//  block-pro
//
//  Created by MAC on 2020/9/2.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateBurstListTableViewCell.h"

@implementation GateBurstListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.titleLb.font =  self.typeLb.font =  self.moneyLb2.font =  self.moneyLb1.font =  gateFont(14, Medium);
    self.titleLb.textColor =  self.typeLb.textColor =  self.moneyLb2.textColor =  self.moneyLb1.textColor =  gateColor(@"283862");
    
    
    self.timeLb.font =  self.jiduLb.font =  self.tageLb.font =  self.sheetLb.font =  gateFont(12, Normal);
     self.timeLb.textColor =  self.jiduLb.textColor =   self.sheetLb.textColor =   self.tageLb.textColor =  gateColor(@"7e87a1");

     self.tageLb.textColor = gateColor(@"f25676");

}
-(void)setBcoin_coin_burst_list_infoModel:(GTBcoin_coin_burst_list_infoModel *)bcoin_coin_burst_list_infoModel{
    _bcoin_coin_burst_list_infoModel = bcoin_coin_burst_list_infoModel;
    
    self.titleLb.text = bcoin_coin_burst_list_infoModel.coin_type;
        self.timeLb.text = [self getDateStringWithTimestamp:bcoin_coin_burst_list_infoModel.time_stamp] ;
       self.typeLb.text =  bcoin_coin_burst_list_infoModel.coin_type;;
//        [self.iocnImageView setImageWithURL:urlWhitString(<#url#>) placeholder:getImage(<#hex#>)];
      
        self.jiduLb.text =  bcoin_coin_burst_list_infoModel.contract_type;
    
        self.moneyLb1.text =[NSString stringWithFormat:@"$%@",bcoin_coin_burst_list_infoModel.price];
        self.tageLb.text =  bcoin_coin_burst_list_infoModel.burst_type;
        self.moneyLb2.text = bcoin_coin_burst_list_infoModel.buy_amount;
    if ([bcoin_coin_burst_list_infoModel.buy_amount doubleValue]>10000) {
          self.moneyLb2.text =[NSString stringWithFormat:@"$%0.2lf万",[bcoin_coin_burst_list_infoModel.buy_amount doubleValue]/10000] ;
    }
        self.sheetLb.text = [NSString stringWithFormat:@"≈$%@张",bcoin_coin_burst_list_infoModel.equal_sheet];
}
// 时间戳转时间,时间戳为13位是精确到毫秒的，10位精确到秒
- (NSString *)getDateStringWithTimestamp:(NSString *)str {
//    NSTimeInterval time = [str doubleValue]/1000; // 传入的时间戳str如果是精确到毫秒的记得要/1000
     NSTimeInterval time = [str doubleValue]; // 传入的时间戳str如果是精确到毫秒的记得要/1000
    NSDate *detailDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // 实例化一个NSDateFormatter对象
    // 设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"MM/dd HH:mm"];
    NSString *currentDateStr = [dateFormatter stringFromDate:detailDate];
    return currentDateStr;
}
@end


