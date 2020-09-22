//
//  GTBurstModel.m
//  CoinTools
//
//  Created by MAC on 2020/9/19.
//  Copyright © 2020 蔡路飞. All rights reserved.
//


#import "GTBurstModel.h"
@implementation GTBcoin_coin_burst_infoModel
+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"burst_amt_1h":@[@"1h_burst_amt"],@"eq_amt_1h":@[@"1h_eq_amt"],@"burst_amt_24":@[@"24h_burst_amt"],@"eq_amt_24":@[@"24h_eq_amt"],};
    
};

@end
@implementation GTBcoin_coin_burst_total_infoModel

@end
@implementation GTBcoin_coin_burst_exchange_infoModel

@end
@implementation GTBcoin_coin_30d_long_short_infoModel

@end
@implementation GTBcoin_coin_30d_calendar_infoModel

@end
@implementation GTBcoin_coin_burst_list_infoModel

@end


@implementation GTBurstModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
   @"bcoin_coin_burst_info" : [GTBcoin_btc_base_infoModel class],
   @"bcoin_coin_burst_total_info" : [GTBcoin_coin_burst_total_infoModel class],
   @"bcoin_coin_burst_exchange_info" : [GTBcoin_coin_burst_exchange_infoModel class],
   @"bcoin_coin_30d_long_short_info" : [GTBcoin_coin_30d_long_short_infoModel class],
   @"bcoin_coin_30d_calendar_info" : [GTBcoin_coin_30d_calendar_infoModel class],
   @"bcoin_coin_burst_list_info" : [GTBcoin_coin_burst_list_infoModel class]};
    
}

@end
