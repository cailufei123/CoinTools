//
//  GateHomeModel.m
//  block-pro
//
//  Created by MAC on 2020/8/27.
//  Copyright © 2020 MAC. All rights reserved.
//

#import "GateHomeModel.h"

@implementation GateBurst_dtlModel

@end
@implementation GateDiffModel

@end
@implementation GateDiffLineModel

@end
@implementation GateLong_shortModel

@end

@implementation GateHomeModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"diff" : [GateDiffLineModel class],@"long_short" : [GateLong_shortModel class],@"poss" : [GateDiffLineModel class],@"burst_dtl":[GateBurst_dtlModel class]};
}
@end

@implementation GateH_burst_amtModel : NSObject

+ (nullable NSDictionary<NSString *, id> *)modelCustomPropertyMapper{
    
    return @{@"h_burst_amt_ch24":@[@"24h_burst_amt_ch"],@"h_burst_amt_us24":@[@"24h_burst_amt_us"],@"h_burst_amt_us1":@[@"1h_burst_amt_us"],@"h_burst_amt_ch1":@[@"1h_burst_amt_ch"],};
    
};



@end
@implementation GTSpaceRatioSubvModel : NSObject

@end


@implementation GTSpaceRatioModel : NSObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"BTC" : [GTSpaceRatioSubvModel class],@"EOS" : [GTSpaceRatioSubvModel class],@"BSV" : [GTSpaceRatioSubvModel class],@"XBT" : [GTSpaceRatioSubvModel class],@"LTC" : [GTSpaceRatioSubvModel class],@"XRP" : [GTSpaceRatioSubvModel class],@"ETH" : [GTSpaceRatioSubvModel class],@"ETC" : [GTSpaceRatioSubvModel class],@"BCH" : [GTSpaceRatioSubvModel class],@"TRX" : [GTSpaceRatioSubvModel class]};
}
@end

@implementation bcoin_coin_long_short_infoModel : NSObject

@end


@implementation GTbcoin_coin_long_short_infoModel : NSObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"Okex_quarter" : [bcoin_coin_long_short_infoModel class],@"Huobi_quarter" : [bcoin_coin_long_short_infoModel class],@"Okex_swap" : [bcoin_coin_long_short_infoModel class]};
}

@end


@implementation GTCoinSpaceRatioModel : NSObject
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"bcoin_all_long_short_info" : [GTSpaceRatioSubvModel class],@"bcoin_exchange_long_short_info" : [GTSpaceRatioSubvModel class]};
}

@end
